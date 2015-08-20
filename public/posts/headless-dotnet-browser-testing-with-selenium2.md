
headless dotnet browser testing with selenium2
----------------------------------------------

Tue March 08, 2011

We're using [Jenkins-CI](http://jenkins-ci.org/) for our CI/Build
server. This post references that but the solution applies regardless to
which CI server you use. Also, the examples I present target 64 bit
windows. With just a change or two, it should also work on 32bit
windows.

This post will give you the code/script to run Selenium 2 as a service,
which you can then use to run headless tests. The key is Sel2, which now
include WebDriver support. WebDriver supports multiple browsers,
including a generic browser which works headlessly. RemoteWebDriver is
the key to headless testing, and Sel2 is the means to do that. Running
as a service is a convenience which I find important in order to work
with our build server.

**What you need**\
 Grab [Selenium Server](http://seleniumhq.org/download/) (v2.0+), and
[NSSM](https://iain.cx/src/nssm/). You'll also need to make sure you
have Java v1.6 or greater.

**NSSM**\
 NSSM is the key to geting it headless and always on. There are other
approaches, but this worked best for me. Basically, you're just wrapping
a call to run the Selenium Server to run as a windows service. I used
all the defaults, and with that am able to run browser web tests
headlessly.

**Selenium 2 and Web Driver**\
 Before v2.0, Selenium did not support WebDriver, and that's a crucial
ingredient. It's what gives you the ability to run browser tests
headlessly. See the documentation
[here](http://seleniumhq.org/docs/03_webdriver.html).\
\
 I'm doing this for .Net projects, so I grabbed the C\# driver for
testing. The Selenium docs explain it better than me, but feel free to
ask questions in the comments if you need more help.\
\

**Install service:**\

``` {.brush: .bash;}
"nssm-2.7/win64/nssm.exe" install SeleniumRC
pause
```

**Windows Registry setting:**\

``` {.brush: .bash;}
Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SeleniumRC\Parameters]
"Application"="C:\\Program Files (x86)\\Java\\jre6\\bin\\java.exe"
"AppDirectory"="D:\\SeleniumRC"
"AppParameters"="-Xrs -jar selenium-server-standalone-2.0b1.jar"
```

**Uninstall service:**\

``` {.brush: .bash;}
"nssm-2.7/win64/nssm.exe" remove SeleniumRC
pause
```

**Headless test:**\

``` {.brush: .csharp;}
using NUnit.Framework;
using Selenium;
using OpenQA.Selenium;

    [TestFixture]
    public class WebUITests  {
        private RemoteWebDriver driver;

        [SetUp]
        public override void Setup() {
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.HtmlUnit();
            desiredCapabilities.IsJavaScriptEnabled = true;
            driver = new RemoteWebDriver(desiredCapabilities);
        }

        [TearDown]
        public override void Teardown() {
        }

        [Test]
        public void MySillyTest() {
            System.Console.WriteLine("\r\n\trunning MySillyTest()..."); //shows output in JenkinsCI console output
            driver.Navigate().GoToUrl("http://google.com");
        }
    }
```

**Note:**\
 This is the short & quick version. I was planning on more detail, but
didn't want to get caught up in making it perfect. Also, I don't have
that much time right now. Please let me know if you have questions, and
I will try to answer them in a timely manner.
