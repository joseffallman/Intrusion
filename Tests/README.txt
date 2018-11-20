-------------------------------------------------
 Writing tests using the Sqx.UnitTest namespace.
-------------------------------------------------

1. Install the CPack Sqx.UnitTest.

2. Create a test class to contain some test methods. There can be more than one test class, and 
   you should use define them with a purpuse to bunch similar tests together. The test class
   can be put in some good folder structure in the Tests folder. (Replace the Example folder with
   your own structure).

3. Write the test methods in the class. Use the syntax GivenSomething_WhenSomething_ThenSomething
   to easily see what your test method is testing (optional).

4. Register all test methods in a test class to the Sqx.UnitTest test engine in the Init method 
   of the test class. See how that is done in the class Tests.Example.ExampleTests.

5. Add your test classes to the Sqx.UnitTest's initialization file (Tests\InitMyTestClasses.sqx).

6. Compile the project.

7. Run the mission. Test result should be seen for the player on the server and in the Arma 3 RPT 
   file.

Upon installing the Sqx.UnitTest CPack, you get one test class (Tests.Example.ExampleTests) for 
free. It's working out of the box, and the tests are run when you start the mission. Use it as a 
template. It should contain everyting of importance, including explaining comments.

If you want to have your own control of when the tests run, remove the following statement from
init.sqf:

>call Sqx_UnitTest_TestEngine_RunDelayedAsync;

Instead you can start the tests yourself from anywhere you want with the following command:

SQX>call Sqx.UnitTest.TestEngine.RunAsync;
SQF>call Sqx_UnitTest_TestEngine_RunAsync;

Good luck unit testing!
Engima