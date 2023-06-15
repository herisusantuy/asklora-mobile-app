import com.google.common.collect.ImmutableMap;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import static java.time.Duration.ofMillis;
import static org.openqa.selenium.interactions.PointerInput.MouseButton.LEFT;
import static org.openqa.selenium.interactions.PointerInput.Origin.viewport;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;

public class AndroidTest {
        AppiumDriver driver;
        WebDriverWait wait;

        String deviceName;
        String udid;
        String platformVersion;
        String firstName = "";
        String lastName = "";
        String hkid = "";
        String phoneNum = "";
        String address = "123 John Doe";
        String email = "testemail" + randomize(100, 1000000);
        String password = "Password1234!";
        String otp;
        int age = randomize(20, 73);

        String[] q1 = { "5 years or above", "3 to less then 5 years", "1 to less then 3 years", "Less than 1 year",
                        "Never" };
        String[] q2 = { "more than HK$150,000", "HK$100,000-HK$149,999", "HK$50,000-HK$99,999", "HK$20,000-HK$49,999",
                        "less than HK$ 20,000" };
        String[] q3 = { "Very accurate", "Somewhat accurate", "Neutral", "Somewhat inaccurate", "Very inaccurate" };
        String[] q4 = { "very high risk",
                        "higher risk of capital loss to achieve substantial returns above deposit interest rates",
                        "moderate risk",
                        "low risk",
                        "I cannot accept any risk of capital loss" };

        String[] q5 = { "Of Course", "I think so..", "Sort of", "Not Really", "No" };
        String[] q6 = { "All the time!", "Usually.", "Sometimes", "Not really...", "That’s not me!" };
        String[] q7 = { "Of course!", "Accurate.", "Sort of", "Not really...", "No!" };
        String[] q89 = { "All the time", "Quite often", "Sometimes", "Not really...", "Never" };
        String[] q101112 = { "All the time", "Quite often", "Sometimes", "Not really...", "That's not me" };
        String[] q13 = { "Definitely yes!", "Somewhat accurate. ", "Sometimes", "Not really...", "No one thinks so." };
        String[] q14 = { "1 year", "Half a year", "3 Months", "1 Month", "2 Weeks" };
        String[] q15 = { "Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly Agree" };
        String[] q16 = { "Lora please choose for me",
                        "Passive income",
                        "Limited loss",
                        "Just buy my stock" };
        String[] omnisearch = { "auto stocks", "bank stocks" };

        /*
         * IMPORTANT:
         * These settings are disabled in Developer options for the Xiaomi Phone:
         * "Verify apps over USB"
         * "Verify bytecode of debuggable apps"
         * "Disable MIUI optimisations"
         * 
         * These settings are enabled in Developer options:
         * "Enable USB debugging (Security settings)"
         * "Install via USB"
         * 
         * You can use cli or gui to run the server
         * If you are using gui, go to advanced -> put "localhost" for server address
         * and check "Allow CORS"
         * If you are using cli, type "appium --address=locahost --allow-cors" into cmd
         * or terminal
         * - I have not tested running appium with cli, so I'm not sure if it will work
         * 
         * run "getProps.sh" before running the UI automation, the setUp method requires
         * the device's name, udid, and version
         * 
         * You must put the apk file into the apps folder and rename the apk to
         * "asklora_stag.apk". You can name the apk to something else but make sure to
         * match the name of the apk in the setUp method
         * 
         * Make sure JAVA_HOME and ANDROID_HOME are set up to use this program to
         * automate creating an account
         * To be able to interact with the scanner and you are using IntelliJ, go to:
         * Help -> Edit Custom VM Options
         * add "-Deditable.java.test.console=true" and restart IDE
         * You should be able to input the otp and confirm you uploaded an image after
         * restarting IDE
         * 
         * There is one part where automation would not work for the Xiaomi phone
         * - You must manually take a picture of the HKID and selfie in order for the
         * program to continue
         * - I have it set to wait for 2 minutes for you to complete the Onfido
         * authorization section
         * 
         * If you are using other phones, there are more parts where automation would
         * not work
         * 1) Entering the otp in the app
         * - You must enter the otp you recieved into the terminal
         * 2) Clicking images
         * - You must click an image to upload and then type done into the terminal
         * 
         * The privacy questions are randomized to only click the first 3 options
         * since clicking enough of the other 2 options would result in ineligibility to
         * create an account
         */

        @BeforeTest
        public void setUp() throws IOException {
                deviceName = getPropValues("deviceName");
                platformVersion = getPropValues("platformVersion");
                udid = getPropValues("udid");
                System.out.println("Device Name: " + deviceName);
                System.out.println("Platform Version: " + platformVersion);
                System.out.println("udid: " + udid);

                DesiredCapabilities caps = new DesiredCapabilities();
                caps.setCapability("platformName", "Android");
                caps.setCapability("automationName", "UiAutomator2");
                caps.setCapability("platformVersion", platformVersion);
                caps.setCapability("udid", udid);
                caps.setCapability("deviceName", deviceName);
                caps.setCapability("app", System.getProperty("user.dir") + "/apps/asklora_stag.apk");
                caps.setCapability("unicodeKeyboard", true);
                caps.setCapability("resetKeyboard", true);
                caps.setCapability("ignoreHiddenApiPolicyError", true);
                // caps.setCapability("autoGrantPermission", true);
                // caps.setCapability("appPackage", "ai.asklora.app.stag");
                // caps.setCapability("appActivity", ".MainActivity");
                // caps.setCapability("noReset", true);
                // caps.setCapability("autoLaunch", false);
                // caps.setCapability("enforceAppInstall", true);
                // caps.setCapability("skipDeviceInitialization", true);
                // caps.setCapability("skipServerInstallation", true);
                caps.setCapability("chromeOptions", ImmutableMap.of("w3c", false));
                driver = new AndroidDriver(new URL("http://localhost:4723/wd/hub"), caps);
                wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        }

        /*
         * Click Begin
         */
        @Test(priority = 1)
        public void testBegin() {
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
                clickBegin();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                clickBegin();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                driver.findElement(By.className("android.widget.EditText")).sendKeys(firstName); // enter firstName
                clickNext();
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(By.xpath("//android.widget.Button[@content-desc='Next']")));
                clickNext();
        }

        /*
         * Click Privacy Questions
         */
        @Test(priority = 2, dependsOnMethods = { "testBegin" })
        public void testPrivacy() {
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.view.View")));
                clickOption(q1[randomize(0, 2)]); // time spent on investing stocks
                clickNext();
                clickOption(q2[randomize(0, 2)]); // salary
                clickNext();
                clickOption(q3[randomize(0, 2)]); // financial stability
                clickNext();
                clickOption(q4[randomize(0, 2)]); // investment risk level
                clickNext();
                driver.findElement(By.className("android.widget.EditText")).sendKeys(String.valueOf(age)); // enter age
                clickNext();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='SURE']")).click();
        }

        /*
         * Click Personality Questions
         */
        @Test(priority = 3, dependsOnMethods = { "testPrivacy" })
        public void testPersonality() {
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.view.View")));
                clickOption(q5[randomize(0, 4)]); // rich vocab
                clickNext();
                clickOption(q6[randomize(0, 4)]); // learn new things
                clickNext();
                clickOption(q7[randomize(0, 4)]); // vivid imagination
                clickNext();
                clickOption(q89[randomize(0, 4)]); // sit still without fidgeting
                clickNext();
                clickOption(q89[randomize(0, 4)]); // trouble sleeping
                clickNext();
                clickOption(q101112[randomize(0, 4)]); // easily annoyed
                clickNext();
                clickOption(q101112[randomize(0, 4)]); // talk to strangers
                clickNext();
                clickOption(q101112[randomize(0, 4)]); // start conversations
                clickNext();
                clickOption(q13[randomize(0, 4)]); // energetic
                clickNext();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(
                                                By.xpath("//android.widget.Button[@content-desc='Got It']")));
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Got It']")).click();
        }

        /*
         * Enter email and password to sign up
         */
        @Test(priority = 4, dependsOnMethods = { "testPersonality" })
        public void testSignUp() {
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.view.View")));
                driver.findElements(By.xpath("//android.widget.EditText")).get(0).click();
                driver.findElements(By.xpath("//android.widget.EditText")).get(0).sendKeys(email + "@yopmail.com");
                System.out.println("email: " + email + "@yopmail.com");
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.widget.EditText")));
                driver.findElements(By.xpath("//android.widget.EditText")).get(1).click();
                driver.findElements(By.xpath("//android.widget.EditText")).get(1).sendKeys(password);
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Sign Up\"))"))
                                .click();
        }

        /*
         * Verify account using yopmail
         */
        @Test(priority = 5, dependsOnMethods = { "testSignUp" })
        public void testVerifyEmail() throws InterruptedException {
                wait.until(ExpectedConditions.visibilityOfElementLocated(
                                By.xpath("//android.view.View[contains(@content-desc, 'sent an email to')]")));
                ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.HOME));
                driver.findElement(AppiumBy.accessibilityId("Chrome")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
                driver.findElement(By.id("com.android.chrome:id/menu_button")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
                driver.findElement(By.xpath("//android.widget.TextView[@content-desc='New tab']")).click();
                driver.findElement(By.className("android.widget.EditText")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("android.widget.EditText")));
                driver.findElement(By.className("android.widget.EditText")).sendKeys("https://yopmail.com/en/");
                ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
                List<WebElement> chromeTextFields = driver.findElements(By.className("android.widget.EditText"));
                System.out.println("Text Fields: " + chromeTextFields);
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(
                                                By.xpath("//android.widget.EditText[contains(@text, 'test')]")));
                driver.findElement(By.xpath("//android.widget.EditText[contains(@text, 'test')]")).click();
                driver.findElement(By.xpath("//android.widget.EditText[contains(@text, 'test')]")).sendKeys(email);
                wait.until(ExpectedConditions.textToBePresentInElement(
                                driver.findElement(By.xpath("//android.widget.EditText[contains(@text, 'test')]")),
                                email));
                driver.findElement(By.className("android.widget.Button")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(
                                                By.xpath("//android.widget.Button[contains(@text, 'Asklora')]")));
                driver.findElement(By.xpath("//android.widget.Button[contains(@text, 'Asklora')]")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(
                                                By.xpath("//android.view.View[@content-desc='Verify Email']")));
                driver.findElement(By.xpath("//android.view.View[@content-desc='Verify Email']")).click();
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("android:id/title")));

                if (!(driver.findElement(By.id("android:id/button_once")).isEnabled())) { // Check if the "Just Once"
                                                                                          // Button is
                                                                                          // disabled
                        driver.findElement(new AppiumBy.ByAndroidUIAutomator("new UiSelector().textContains(\"Stag\")"))
                                        .click();
                        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                        driver.findElements(By.className("android.widget.Button")).get(0).click();
                } else {
                        driver.findElement(By.id("android:id/button_once")).click();
                }
        }

        @Test(priority = 6, dependsOnMethods = { "testVerifyEmail" })
        public void testInvestmentStyle() {
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Define Investment Style']"))
                                .click();
                clickEditText();
                for (String s : omnisearch) {
                        driver.findElement(By.className("android.widget.EditText")).sendKeys(s);
                        driver.findElement(By.className("android.widget.Button")).click();
                        clickEditText();
                }
                clickNext();
                clickOption(q14[randomize(0, 4)]);
                clickNext();
                clickOption(q15[randomize(0, 4)]);
                clickNext();
                clickOption(q16[randomize(0, 3)]);
                clickNext();
                wait.until(ExpectedConditions.visibilityOfElementLocated(
                                By.xpath("//android.widget.Button[contains(@content-desc, 'Investment')]")));
                driver.findElement(By.xpath("//android.widget.Button[contains(@content-desc, 'Investment Account')]"))
                                .click();
        }

        @Test(priority = 7, dependsOnMethods = { "testInvestmentStyle" })
        public void testAccountSetUp() {
                wait.until(ExpectedConditions.visibilityOfElementLocated(
                                By.xpath("//android.view.View[contains(@content-desc, 'Account opening and deposit')]")));
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Open Account Now\"))"))
                                .click();
                driver.findElement(By.xpath("(//android.view.View[@content-desc='No'])[1]")).click();
                driver.findElement(By.xpath("(//android.view.View[@content-desc='Yes'])[2]")).click();
                clickNext();
                driver.findElements(By.className("android.widget.EditText")).get(0).click();
                driver.findElements(By.className("android.widget.EditText")).get(0).sendKeys(firstName);
                driver.findElements(By.className("android.widget.EditText")).get(1).click();
                driver.findElements(By.className("android.widget.EditText")).get(1).sendKeys(lastName);
                driver.findElement(By.xpath("//android.view.View[@content-desc='Female']")).click();
                driver.findElements(By.className("android.widget.EditText")).get(2).click();
                driver.findElements(By.className("android.widget.EditText")).get(2).sendKeys(hkid);
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Nationality\"))"))
                                .click();
                driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Hong Kong SAR')]")).click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Country Of Birth\"))"))
                                .click();
                driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Hong Kong SAR')]")).click();
                driver.findElement(By.xpath(
                                "//android.view.View[contains(@content-desc, 'Phone')]/android.widget.EditText[2]"))
                                .click();

                try {
                        driver.findElement(By.id("android:id/text1"));
                        driver.findElement(By.id("android:id/text1")).click();
                } catch (Exception e) {
                        System.out.println("No prev phone number");
                        driver.findElement(
                                        By.xpath("//android.view.View[contains(@content-desc, 'Phone')]/android.widget.EditText[2]"))
                                        .sendKeys(phoneNum);
                }
                clickNext();
                getOTP();
        }

        @Test(priority = 8, dependsOnMethods = { "testAccountSetUp" })
        public void testAddress() {
                List<WebElement> addressTextFields = driver.findElements(By.className("android.widget.EditText"));
                System.out.println("Text Fields: " + addressTextFields);
                driver.findElements(By.className("android.widget.EditText")).get(0).click();
                driver.findElements(By.className("android.widget.EditText")).get(0).sendKeys(address);
                driver.findElement(By.xpath("//android.widget.Button[contains(@content-desc, 'District')]")).click();
                driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Islands')]")).click();
                driver.findElement(By.xpath("//android.widget.Button[contains(@content-desc, 'Region')]")).click();
                driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Hong Kong Island')]"))
                                .click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().className(\"android.widget.ImageView\"))"))
                                .click();
                getImage();
                clickNext();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Confirm & Continue\"))"))
                                .click();
        }

        @Test(priority = 9, dependsOnMethods = { "testAddress" })
        public void testFinancialProfile() {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"No\"))"))
                                .click();
                driver.findElement(By.xpath("//android.widget.Button[contains(@content-desc, 'Employment Status')]"))
                                .click();
                driver.findElement(By.xpath("//android.view.View[@content-desc='Student']")).click();
                clickNext();
                driver.findElement(By.xpath("//android.view.View[@content-desc='Income from Employment']")).click();
                clickNext();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc=' No']")).click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Confirm & Continue\"))"))
                                .click();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Verify Now']")).click();
                WebDriverWait waitForVerification = new WebDriverWait(driver, Duration.ofSeconds(120));
                waitForVerification.until(ExpectedConditions.visibilityOfElementLocated(
                                By.xpath("//android.widget.ImageView[@content-desc='Asklora Customer Agreement.pdf']")));
                driver.findElement(
                                By.xpath("//android.widget.ImageView[contains(@content-desc, 'Asklora Customer Agreement')]"))
                                .click();
                driver.findElements(By.className("android.widget.CheckBox")).get(0).click();
                driver.findElements(By.className("android.widget.CheckBox")).get(1).click();
                scrollDown();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Agree']")).click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().className(\"android.widget.CheckBox\"))"))
                                .click();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Agree']")).click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().className(\"android.widget.CheckBox\"))"))
                                .click();
                clickEditText();
                driver.findElement(By.className("android.widget.EditText")).sendKeys(firstName + " " + lastName);
                scrollDown();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Agree']")).click();
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Complete\"))"))
                                .click();
        }

        @Test(priority = 10, dependsOnMethods = { "testFinancialProfile" })
        public void testDepositFunds() {
                wait.until(ExpectedConditions.visibilityOfElementLocated(
                                By.xpath("//android.widget.Button[contains(@content-desc, 'Deposit Funds')]")));
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Deposit Funds']")).click();
                clickEditText();
                driver.findElement(By.className("android.widget.EditText")).sendKeys("100000");
                driver.findElement(By.className("android.widget.ScrollView")).click();
                scrollDown();
                driver.findElement(By.className("android.widget.ImageView")).click();
                getImage();
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Continue']")).click();
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(By.xpath("//android.widget.Button[@content-desc='Done']")));
                driver.findElement(By.xpath("//android.widget.Button[@content-desc='Done']")).click();
        }

        public String getPropValues(String var) throws IOException {
                Properties prop = new Properties();
                FileInputStream ip = new FileInputStream("config.properties");
                prop.load(ip);
                return prop.getProperty(var);
        }

        public void clickBegin() {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Begin\"))"))
                                .click();
        }

        public void clickNext() {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"Next\"))"))
                                .click();
        }

        public void clickOption(String option) {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().descriptionContains(\"" + option
                                                + "\"))"))
                                .click();
        }

        public void clickEditText() {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                                ".scrollIntoView(new UiSelector().className(\"android.widget.EditText\"))"))
                                .click();
        }

        public void getOTP() {
                if (deviceName.contains("M2101K9G")) {
                        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                        ((AndroidDriver) driver).openNotifications();
                        wait.until(ExpectedConditions
                                        .visibilityOfElementLocated(By.xpath(
                                                        "//android.widget.Button[contains(@content-desc, 'Copy')]")));
                        driver.findElement(By.xpath("//android.widget.Button[contains(@content-desc, 'Copy')]"))
                                        .click();
                        ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.BACK));
                        otp = ((AndroidDriver) driver).getClipboardText();
                        System.out.println("Received otp: " + otp);
                        clickEditText();
                        driver.findElement(By.className("android.widget.EditText")).sendKeys(otp);
                }
                Scanner scanner = new Scanner(System.in);
                System.out.print("Enter otp: ");
                otp = scanner.nextLine();
                System.out.println("Received otp: " + otp);
                clickEditText();
                driver.findElement(By.className("android.widget.EditText")).sendKeys(otp);
                scanner.close();
        }

        public void scrollDown() {
                Dimension dimension = driver.manage().window().getSize();
                Point start = new Point((int) (dimension.width * 0.5), (int) (dimension.height * 0.9));
                Point end = new Point((int) (dimension.width * 0.2), (int) (dimension.height * 0.1));

                PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
                // Sequence scroll = new Sequence(finger, 0);

                Sequence swipe = new Sequence(finger, 1)
                                .addAction(finger.createPointerMove(ofMillis(0), viewport(), start.getX(),
                                                start.getY()))
                                .addAction(finger.createPointerDown(LEFT.asArg()))
                                .addAction(finger.createPointerMove(ofMillis(1000), viewport(), end.getX(), end.getY()))
                                .addAction(finger.createPointerUp(LEFT.asArg()));
                driver.perform(Arrays.asList(swipe));
        }

        public void getImage() {
                if (deviceName.contains("M2101K9G")) {
                        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                        driver.findElement(By.id("android:id/button_once")).click();
                        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
                        List<WebElement> photoWidget = driver
                                        .findElements(By.className("android.widget.RelativeLayout"));
                        System.out.println("Image relative layout: " + photoWidget);
                        driver.findElement(By.className("android.widget.RelativeLayout")).click();
                        driver.findElement(By.xpath(
                                        "//android.view.ViewGroup[@content-desc='Photo taken on 7 Jun 2023 21:30:08']"))
                                        .click();
                } else {
                        Scanner scanner = new Scanner(System.in);
                        System.out.print("Type done when you finish uploading an image: ");
                        String str = scanner.nextLine();
                        if (str.contains("done"))
                                scrollDown();
                        scanner.close();
                }
        }

        public int randomize(int min, int max) {
                return ThreadLocalRandom.current().nextInt(min, max + 1);
        }

}