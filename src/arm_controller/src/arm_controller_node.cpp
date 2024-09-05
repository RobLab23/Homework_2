#include<ros/ros.h>
#include"sensor_msgs/JointState.h" //for Subscriber
#include"std_msgs/Float64.h" //for Publishers

void printJointPosition_CB(const sensor_msgs::JointState& msg)
{
    for(int i=0; i<4; i++){
        ROS_INFO("Joint_Position_[%i] : [%f]", i, msg.position[i]);
    }
}

int main(int argc, char* argv[])
{
ros::init(argc, argv, "arm_controller_node");
ros::NodeHandle nodeHandle;
ros::Rate loopRate(10);

ros::Subscriber subscriber = nodeHandle.subscribe("/arm/joint_states",1,printJointPosition_CB);

ros::Publisher jointPublisher0 = nodeHandle.advertise<std_msgs::Float64>("/arm/PositionJointInterface_J0_controller/command", 1);
ros::Publisher jointPublisher1 = nodeHandle.advertise<std_msgs::Float64>("/arm/PositionJointInterface_J1_controller/command", 1);
ros::Publisher jointPublisher2 = nodeHandle.advertise<std_msgs::Float64>("/arm/PositionJointInterface_J2_controller/command", 1);
ros::Publisher jointPublisher3 = nodeHandle.advertise<std_msgs::Float64>("/arm/PositionJointInterface_J3_controller/command", 1);

while(ros::ok()){
    std_msgs::Float64 pos0, pos1, pos2, pos3;
    pos0.data=0.1;
    pos1.data=0.2;
    pos2.data=0.3;
    pos3.data=0.4;

    jointPublisher0.publish(pos0);
    jointPublisher1.publish(pos1);
    jointPublisher2.publish(pos2);
    jointPublisher3.publish(pos3);

    ros::spinOnce();
    loopRate.sleep();
}

return 0;
}