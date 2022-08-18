
#ifndef _UXR_CLIENT_CONFIG_H_
#define _UXR_CLIENT_CONFIG_H_

#define UXR_CLIENT_VERSION_MAJOR	0			// by srliu-2022-08-18 11:51:55
#define UXR_CLIENT_VERSION_MINOR 	1			// by srliu-2022-08-18 11:51:55
#define UXR_CLIENT_VERSION_MICRO 	2			// by srliu-2022-08-18 11:51:55
#define UXR_CLIENT_VERSION_STR 		"0.1.2"		// by srliu-2022-08-18 11:51:55

/*
 * Configure by hand, srliu-2022-08-18 11:51:55.
 */
//#define UCLIENT_PROFILE_DISCOVERY				// "Enable discovery profile."
//#define UCLIENT_PROFILE_UDP						// "Enable UDP transport."
//#define UCLIENT_PROFILE_TCP						// "Enable TCP transport."
//#define UCLIENT_PROFILE_CAN						// "Enable CAN FD transport."
//#define UCLIENT_PROFILE_SERIAL					// "Enable Serial transport."
#define UCLIENT_PROFILE_CUSTOM_TRANSPORT		// "Enable Custom transport."

//#define UCLIENT_PROFILE_MULTITHREAD				// "Enable multithread support."
//#define UCLIENT_PROFILE_SHARED_MEMORY			// "Enable shared memory transport support."
#define UCLIENT_PROFILE_STREAM_FRAMING			// "Enable stream framing protocol."


//#define UCLIENT_PLATFORM_POSIX
//#define UCLIENT_PLATFORM_POSIX_NOPOLL
//#define UCLIENT_PLATFORM_WINDOWS
//#define UCLIENT_PLATFORM_FREERTOS_PLUS_TCP
//#define UCLIENT_PLATFORM_RTEMS_BSD_NET
//#define UCLIENT_PLATFORM_ZEPHYR


#define UXR_CONFIG_MAX_OUTPUT_BEST_EFFORT_STREAMS		1		// "Set the maximum number of output best-effort streams for session."
#define UXR_CONFIG_MAX_OUTPUT_RELIABLE_STREAMS        	1		// "Set the maximum number of output reliable streams for session."
#define UXR_CONFIG_MAX_INPUT_BEST_EFFORT_STREAMS      	1		// "Set the maximum number of input best-effort streams for session."
#define UXR_CONFIG_MAX_INPUT_RELIABLE_STREAMS         	1		// "Set the maximum number of input reliable streams for session."

#define UXR_CONFIG_MAX_SESSION_CONNECTION_ATTEMPTS    	10 		// "Set the number of connection attemps."
#define UXR_CONFIG_MIN_SESSION_CONNECTION_INTERVAL    	1000	// "Set the connection interval in milliseconds."
#define UXR_CONFIG_MIN_HEARTBEAT_TIME_INTERVAL        	100		// "Set the time interval between heartbeats in milliseconds."

#ifdef UCLIENT_PROFILE_UDP
#define UXR_CONFIG_UDP_TRANSPORT_MTU                  	512		// "Set the UDP transport MTU."
#endif
#ifdef UCLIENT_PROFILE_TCP
#define UXR_CONFIG_TCP_TRANSPORT_MTU                  	512		// "Set the TCP transport MTU."
#endif
#ifdef UCLIENT_PROFILE_SERIAL
#define UXR_CONFIG_SERIAL_TRANSPORT_MTU               	512		// "Set the Serial transport MTU."
#endif
#ifdef UCLIENT_PROFILE_CUSTOM_TRANSPORT
#define UXR_CONFIG_CUSTOM_TRANSPORT_MTU               	512 	// "Set the Custom transport MTU."
#endif

#ifdef UCLIENT_PROFILE_SHARED_MEMORY
#define UXR_CONFIG_SHARED_MEMORY_MAX_ENTITIES          	4		// "Max number of entities involved in shared memory."
#define UXR_CONFIG_SHARED_MEMORY_STATIC_MEM_SIZE       	10 		// "Max number data buffers stored in shared memory"
#endif

#define UCLIENT_TWEAK_XRCE_WRITE_LIMIT				// "This feature uses a tweak to allow XRCE WRITE DATA submessages grater than 64 kB."
//#define UCLIENT_HARD_LIVELINESS_CHECK				// "Enable hard liveliness check."


#ifdef UCLIENT_HARD_LIVELINESS_CHECK
#define UXR_CONFIG_HARD_LIVELINESS_CHECK_TIMEOUT_STR	10000	// "This feature uses a tweak to allow XRCE WRITE DATA submessages grater than 64 kB."
#endif


// Version checks
#if UXR_CLIENT_VERSION_MAJOR >= 3
#error UCLIENT_HARD_LIVELINESS_CHECK shall be included in session API
#error MTU must be included in CREATE_CLIENT_Payload properties
#error Reorder ObjectInfo https://github.com/eProsima/Micro-XRCE-DDS/issues/137
#endif

#endif // _UXR_CLIENT_CONFIG_H_
