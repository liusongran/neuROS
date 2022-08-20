## Design of inter-task communication paradigm in neuROS
This proposal is used to make Micro-ROS applications be able to do inter-process like communications when they are in different `executor`s declared in different `main()` functions, without participants of lower DDS/RMW layer.

### InterManager (ITEM)