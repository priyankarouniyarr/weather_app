import 'dart:io';

void main(){
  performTasks();
}


void performTasks()  {
   task1();
   task2();
   task3();
}
// void performTasks()  async {
//    task1();
//     String? task2data=  await task2();
//    task3(task2data);
// }

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2()  {
  Duration fivesecond=Duration(seconds: 2);
  sleep(fivesecond);//here fivesecond is object and it will pause for 5 second
  String result = 'task 2 data'; //in case of synchronous
  print('Task 2 complete');
}
//in asynchoronus 
// Future<String?> task2() async{

//   Duration threesecond= Duration(seconds: 3);
//     String result;
//    await Future.delayed(threesecond,(){
//     result ='task 2 get completed';
//     print ("task 2 completed");
//   });
// }

// void task3() {
//  String result = 'task 3 data';
//   print('Task 3 complete');}

void task3() {
 String result = 'task 3 data';
  print('Task 3 complete with ');}//web doesnot support sleep
  