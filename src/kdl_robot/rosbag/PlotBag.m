%%Bag Selection

bag = rosbag('/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/LinTrap.bag');
%bag = rosbag('/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/LinCub.bag');
%bag = rosbag('/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/CircTrap.bag');
%bag = rosbag('/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/CircCub.bag');

jnt1 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_1_effort_controller/command'));
jnt2 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_2_effort_controller/command'));
jnt3 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_3_effort_controller/command'));
jnt4 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_4_effort_controller/command'));
jnt5 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_5_effort_controller/command'));
jnt6 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_6_effort_controller/command'));
jnt7 = timeseries(bag.select('Topic','/iiwa/iiwa_joint_7_effort_controller/command'));
pos_err = timeseries(bag.select('Topic','/iiwa/error'));

figure;
hold on;
plot(jnt1.Data)
plot(jnt2.Data)
plot(jnt3.Data)
plot(jnt4.Data)
plot(jnt5.Data)
plot(jnt6.Data)
plot(jnt7.Data)
grid on;
legend show;
xlabel('Time [s]');
ylabel('Torque [Nm]');

figure;
plot(pos_err.Data)
grid on;
legend show;

