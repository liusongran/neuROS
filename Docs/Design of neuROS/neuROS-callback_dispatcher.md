## callback dispatcher design in neuROS
> Maintained by Wang Zilong


### 设计思路
+ 先定义subscription和timer结构体。
```C
typedef struct{
	int options;
	int qos;
}rcl_subscription_t;//根据后期需要修改或添加参数

typedef struct{
	int options;
	int qos;
}rcl_timer_t;//根据后期需要修改或添加参数
```
+ 根据micro-ROS，定义rclc_executor_handle_t和rcl_executor_t结构体。
```C
//定义一个无返回值的函数指针类型，形参为void *类型
typedef void (* rcl_subscription_callback_t)(/*void */);
//定义一个无返回值的函数指针类型，形参为rcl_timer_t *和int64_t
typedef void (* rcl_timer_callback_t)(/*rcl_timer_t *, int64_t*/);

typedef enum{
	SUBSCRIPTION,
	TIMER
}rcl_executor_handle_type_t;

typedef struct{
	rcl_executor_handle_type_t type;
	union{
		void * subscription;
		void * timer;
	};
	union{
		rcl_subscription_callback_t subscription_callback;
		rcl_timer_callback_t timer_callback;
	};
	/*void *data;//这里应与micro-ROS看齐，也就是说subscription回调函数的形参为void *类型，timer回调函数的形参为rcl_timer_t *和int64_t，这里为简便，将回调函数的参数统一设置为无*/
}rclc_executor_handle_t;

typedef struct{
	//unsigned long long index;
	//rcl_wait_set_t *wait_set;

	rclc_executor_handle_t *subscription_handles;//只有定义，并未分配地址空间
	int subscription_front,subscription_rear;//定义成循环队列

	rclc_executor_handle_t *timer_handles;//只有定义，并未分配地址空间
	int timer_front,timer_rear;//定义成循环队列

	int number_of_subscriptions;
	int number_of_timers;
}rcl_executor_t;
```
+ 实现操作rcl_executor_t的函数。
```C
//初始化操作
void Init_executor(rcl_executor_t *executor){
	executor->subscription_handles=(rclc_executor_handle_t *)malloc(sizeof(rclc_executor_handle_t)*maxsize);//为指针分配地址空间
	executor->subscription_front=executor->subscription_rear=0;

	executor->timer_handles=(rclc_executor_handle_t *)malloc(sizeof(rclc_executor_handle_t)*maxsize);//为指针分配地址空间
	executor->timer_front=executor->timer_rear=0;

	executor->number_of_subscriptions=0;
	executor->number_of_timers=0;
}

//从executor中删除subscription或者timer的函数并未实现
bool rclc_executor_add_subscription(rcl_executor_t *executor,rcl_subscription_t * subscription,rcl_subscription_callback_t callback){
	executor->subscription_handles[executor->subscription_rear].type=SUBSCRIPTION;
	executor->subscription_handles[executor->subscription_rear].subscription=subscription;
	executor->subscription_handles[executor->subscription_rear].subscription_callback=callback;
	executor->subscription_rear=(executor->subscription_rear+1)%maxsize;
	executor->number_of_subscriptions++;
	return true;
}

bool rclc_executor_add_timer(rcl_executor_t *executor,rcl_timer_t * timer,rcl_timer_callback_t callback){
	executor->timer_handles[executor->timer_rear].type=TIMER;
	executor->timer_handles[executor->timer_rear].timer=timer;
	executor->timer_handles[executor->timer_rear].timer_callback=callback;
	executor->timer_rear=(executor->timer_rear+1)%maxsize;
	executor->number_of_timers++;
	return true;
}

//在创建subscription或timer的同时将其加入executor中，这两个函数不注重subscription或timer的内置参数，日后根据需要修改
rcl_subscription_t create_subscription(rcl_executor_t *executor,rcl_subscription_callback_t callback /* int options,int qos */){
	rcl_subscription_t subscription;
	/*subscription.options=options;//subscription的内置参数可在此处初始化
	subscription.qos=qos;*/
	rclc_executor_add_subscription(executor, &subscription, callback);
	return subscription;
}

rcl_timer_t create_timer(rcl_executor_t *executor,rcl_timer_callback_t callback){
	rcl_timer_t timer;
	rclc_executor_add_timer(executor, &timer, callback);
	return timer;
}

rcl_executor_t executor;//只能定义成全局变量
```
+ 两个task任务函数的定义,task1用来循环调用所有subscription的回调函数，task2用来循环调用所有timer的回调函数，互斥信号量的说明见运行结果。
```C
void task1_task(void *pvParameters){
	while(1){
		xSemaphoreTake(MutexSemaphore,portMAX_DELAY);//获取互斥信号量
		printf("+task1_task running...\n");
		for(int i=executor.subscription_front;i<executor.subscription_rear;++i){
			executor.subscription_handles[i].subscription_callback();
		}
		xSemaphoreGive(MutexSemaphore);//释放互斥信号量
		vTaskDelay(1000);
	}
}

void task2_task(void *pvParameters){
	while(1){
		xSemaphoreTake(MutexSemaphore,portMAX_DELAY);	//获取互斥信号量
		printf("+task2_task running...\n");
		for(int i=executor.timer_front;i<executor.timer_rear;++i){
			executor.timer_handles[i].timer_callback();
		}
		xSemaphoreGive(MutexSemaphore);//释放互斥信号量
		vTaskDelay(1000);
	}
}
```
+ StartDefaultTask任务函数的定义。
```C
void StartDefaultTask(void *argument) {

	printf("\nStartDefaultTask!\n");

	Init_executor(&executor);

	//创建互斥信号量
	MutexSemaphore=xSemaphoreCreateMutex();

	//创建TASK1任务
	xTaskCreate ( (TaskFunction_t )task1_task,
                (const char*    )"task1_name",
                (uint16_t       )TASK1_STK_SIZE,
                (void*          )NULL,
                (UBaseType_t    )TASK1_TASK_PRIO,
                (TaskHandle_t*  )&Task1Task_Handler);
	//创建TASK2任务
	xTaskCreate ( (TaskFunction_t )task2_task,
                (const char*    )"task2_name",
                (uint16_t       )TASK2_STK_SIZE,
                (void*          )NULL,
                (UBaseType_t    )TASK2_TASK_PRIO,
                (TaskHandle_t*  )&Task2Task_Handler);

	//创建两个subscription和两个timer
    //function1和function2被分别设置为两个subscription的回调函数
    //function3和function4被分别设置为两个timer的回调函数
	create_subscription(&executor, function1);
	create_subscription(&executor, function2);
	create_timer(&executor, function3);
	create_timer(&executor, function4);

	vTaskDelete(defaultTaskHandle);//删除开始任务
}
```
### 运行结果
将task1和task2的优先级设置为相同。
```C
#define maxsize           10

#define TASK1_TASK_PRIO		3
#define TASK2_TASK_PRIO		3

#define TASK1_STK_SIZE 		512
#define TASK2_STK_SIZE 		512

TaskHandle_t Task1Task_Handler;
TaskHandle_t Task2Task_Handler;
```
+ 当不使用互斥信号量时，运行结果为：
![](https://img7.uploadhouse.com/fileuploads/29501/295015278c286137e420d9d59a56099cb753320d.png)
+ 当使用互斥信号量时，运行结果为：   
![](https://img8.uploadhouse.com/fileuploads/29501/29501528bd2487a260be138ab1da6058dbe91024.png)   
可见互斥信号量起到作用，不同task内被互斥信号量保护的代码可互斥访问。
### 额外思考
+ 最初设想是将rcl_executor_t内的subscription_handles和timer_handles设置为指针数组形式，这样可以更加节省空间，然而写完代码之后发现，使用指针数组的本质是动态分配地址空间，在一个函数内定义完一个rclc_executor_handle_t后，使对应的指针指向该内容，然而在这个函数返回后，该内容会被释放掉，此时指向该内容的指针就会不知所措，虽然程序不会报错，但不会得到预期的结果，所以最终还是选择静态分配地址空间的方式，如果找到在不同task之间传递信息的方法，可以继续尝试动态分配地址空间的方式。
+ 根据micro-ROS，最开始想要设计一套从DDS中间件接收信息的机制。
```C
typedef struct{
	const rcl_subscription_t *subscriptions[maxsize];//指针数组
	int size_of_subscriptions;
	const rcl_timer_t *timers[maxsize];
	int size_of_timers;
}rcl_wait_set_t;

rcl_wait_set_t Init_wait_set(){
	rcl_wait_set_t wait_set;
	wait_set.size_of_subscriptions=0;
	wait_set.size_of_timers=0;
	return wait_set;
}

void wait_set_subscription_add(rcl_wait_set_t *wait_set,const rcl_subscription_t *subscription){
	wait_set->subscriptions[wait_set->size_of_subscriptions++]=subscription;
}

void wait_set_timer_add(rcl_wait_set_t *wait_set,const rcl_timer_t *timer){
	wait_set->timers[wait_set->size_of_timers++]=timer;
}

//在创建subscription或timer的同时将其入wait_set
rcl_subscription_t create_subscription(rcl_wait_set_t *wait_set){
	rcl_subscription_t subscription;
	wait_set_subscription_add(wait_set, &subscription);
	return subscription;
}

rcl_timer_t create_timer(rcl_wait_set_t *wait_set){
	rcl_timer_t timer;
	wait_set_timer_add(wait_set, &timer);
	return timer;
}

//创建一个executor，从executor中的wait_set中取数据到executor中的handles
bool take_new_data(rclc_executor_handle_t *handle,rcl_wait_set_t *wait_set){
	switch(handle->type){
	case SUBSCRIPTION:
		if(wait_set->size_of_subscriptions==0)
			return false;
		handle->subscription=wait_set->subscriptions[--wait_set->size_of_subscriptions];//下标=数目-1
		break;
	case TIMER:
		if(wait_set->size_of_timers==0)
			return false;
		handle->timer=wait_set->timers[--wait_set->size_of_timers];
		break;
	}
	return true;
}
```
工程太过巨大，而且对wait_set的功能理解不够，只好做减法，日后对micro-ROS的代码有一定理解后可继续尝试。
### 未来方向
主要修改executor.c文件中的_rclc_execute()等函数，根据所建立的task个数将本程序嵌入到micro-ROS中去。