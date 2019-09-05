-------------------------------------------------
 Writing tests using the Sqx.UnitTest namespace.
-------------------------------------------------

1. Install the CPack Sqx.UnitTest.

2. Create a test class to contain some test methods. There can be more than one test class, and 
   you should use define them with a purpuse to bunch similar tests together. The test class
   can be put in some good folder structure in the Tests folder. (Replace the Example folder with
   your own structure).

3. Write the test methods in the class. Use the syntax GivenSomething_WhenSomething_ThenSomething
   for each test method to easily see what it is testing.

4. Register all test methods in a test class to the Sqx.UnitTest test engine in the Init method 
   of the test class. See how that is done in the class Tests.Example.ExampleTests.

5. Add your test classes to the Sqx.UnitTest's initialization file (Tests\InitMyTestClasses.sqx).

6. Compile the project.

7. Run the mission. Test result is displayed to the player on the server and in the Arma 3 RPT 
   file. It is also copied to the clipboard, and can be pasted into any text editor.
   
8. When you have a lot of your own classes to test you might need to change the place where call
   to "Sqx.UnitTest.TestEngine.RunDelayedAsync" is made. Remomve it from the last line in 
   Sqx\UnitTest\Init.sqx and put it somewhere where all your dependencies are loaded.

Upon installing the Sqx.UnitTest CPack, you get one test class (Tests.Example.ExampleTests) for 
free. It's working out of the box, and the tests are run when you start the mission. Use it as a 
template. It should contain everyting of importance, including explaining comments.

If you want to have your own control of when the tests run, remove the following statement from
init.sqf:

>call Sqx_UnitTest_TestEngine_RunDelayedAsync;

Instead you can start the tests yourself from anywhere you want with the following command:

SQX: >call Sqx.UnitTest.TestEngine.RunAsync;
SQF: >call Sqx_UnitTest_TestEngine_RunAsync;

-----------------
 Version History
-----------------

1.0 First version.

1.1 Message to Assert is now optional.
    Assert.IsNull and Assert.IsNotNull improved to handle Sqx classes.
    Only one assert per test is now reported.
    
1.2 Fixed: Bug in Assert.IsNull when testing an SqxClass.
    Added methods Assert.IsTrue and Assert.IsFalse.
    README changed location from Tests to Sqx\UnitTest.
    
1.3 Added method TestEngine.OnlyThisOne to run only one of the test class' registered tests more easily.
    The test report is now copied to clipboard.
    Added error message for when the test class does not exist.
    Test framework now warns if a test method does not reach Assert.
    Fixed: Change == to "isEqualTo" in Assert.AreEqual.
    Fixed: The Assert did not really assert (i.e. break execution). Now when a test fails, execution of the current test ends.
    Fixed: nil values were not handled.


Good luck unit testing!
Engima
