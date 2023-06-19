import com.google.common.collect.ImmutableMap;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidStartScreenRecordingOptions;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.screenrecording.CanRecordScreen;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import static java.time.Duration.ofMillis;
import static org.openqa.selenium.interactions.PointerInput.MouseButton.LEFT;
import static org.openqa.selenium.interactions.PointerInput.Origin.viewport;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

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
 * You must create a folder called "apps" then put the apk file into the folder and rename the apk to
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
 * There are certain parts where automation would not work, there are more parts where automation would
 * not work
 * 1) Entering the otp in the app (using Stag to test automation)
 * - You must enter the otp you received into the terminal
 * 2) Onfido
 * - You must manually take a picture of the HKID and selfie
 *
 * The privacy questions are randomized to only click the first 3 options to ensure eligibility to
 * create an account
 */

public class AndroidSignUpTest {
        AppiumDriver driver;
        WebDriverWait wait;
        HKIDGenerator generator = new HKIDGenerator();

        String deviceName, udid, platformVersion, name, firstName, lastName, gender, otp, address, city;
        final String hkid = generator.getHKIDgenerated();
        final String phoneNum = ""; // enter a phone number before automation testing
        final String email = "testemail" + randomize(100, 1000000);
        final String password = "Password1234!";
        final int age = randomize(20, 73);
        final String FIND_BY_EDIT_TEXT = "android.widget.EditText";
        final String FIND_BY_CHECK_BOX = "android.widget.CheckBox";
        final String FIND_BY_IMAGE_VIEW = "android.widget.ImageView";
        final String TEST_APP = "Stag"; // The other one would be "Dev"

        String[] investTime = { "5 years or above", "3 to less then 5 years", "1 to less then 3 years", "Less than 1 year",
                        "Never" };
        String[] salary = { "more than HK$150,000", "HK$100,000-HK$149,999", "HK$50,000-HK$99,999", "HK$20,000-HK$49,999",
                        "less than HK$ 20,000" };
        String[] financialStability = { "Very accurate", "Somewhat accurate", "Neutral", "Somewhat inaccurate", "Very inaccurate" };
        String[] riskLevel = { "very high risk",
                        "higher risk of capital loss to achieve substantial returns above deposit interest rates",
                        "moderate risk",
                        "low risk",
                        "I cannot accept any risk of capital loss" };

        String[] richVocab = { "Of Course", "I think so", "Sort of", "Not Really", "No" };
        String[] learnNewThings = { "All the time", "Usually.", "Sometimes", "Not really", "That’s not me" };
        String[] vividImagination = { "Of course", "Accurate", "Sort of", "Not really", "No!" };
        String[] fidgetAndBadDream = { "All the time", "Quite often", "Sometimes", "Not really", "Never" };
        String[] annoyedStrangersConvo = { "All the time", "Quite often", "Sometimes", "Not really", "That's not me" };
        String[] energetic = { "Definitely yes", "Somewhat accurate", "Sometimes", "Not really", "No one thinks so" };
        String[] investDuration = { "1 year", "Half a year", "3 Months", "1 Month", "2 Weeks" };
        String[] largeAmount = { "Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly Agree" };
        String[] investmentScenario = { "Lora please choose for me", "Passive income", "Limited loss", "Just buy my stock" };
        String[] omnisearch = { "auto stocks", "bank stocks", "tesla", "car", "tech", "medical", "research", "oil", "burger", "robot" };

        @BeforeTest
        public void setUp() throws IOException {
                deviceName = getPropValues("deviceName");
                platformVersion = getPropValues("platformVersion");
                udid = getPropValues("udid");
                getPerson();

                System.out.println("Device Name: " + deviceName);
                System.out.println("Platform Version: " + platformVersion);
                System.out.println("udid: " + udid);
                System.out.println("Name: " + name);
                System.out.println("Gender: " + gender);
                System.out.println("hkid: " + hkid);
                System.out.println("address: " + address);
                System.out.println("city: " + city);

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
//                 caps.setCapability("autoGrantPermission", true);
//                 caps.setCapability("appPackage", "ai.asklora.app.stag");
//                 caps.setCapability("appActivity", ".MainActivity");
//                 caps.setCapability("noReset", true);
//                 caps.setCapability("autoLaunch", false);
//                 caps.setCapability("enforceAppInstall", true);
//                 caps.setCapability("skipDeviceInitialization", true);
//                 caps.setCapability("skipServerInstallation", true);
                caps.setCapability("chromeOptions", ImmutableMap.of("w3c", false));
                caps.setCapability("newCommandTimeout", 0);
                driver = new AndroidDriver(new URL("http://localhost:4723/wd/hub"), caps);
                wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        }

        /*
         * Click Begin
         */
        @Test(priority = 1)
        public void testBegin() {
                ((CanRecordScreen) driver).startRecordingScreen(new AndroidStartScreenRecordingOptions()
                        .withTimeLimit(Duration.ofMinutes(5)));

                clickContentDescription("Begin");
                clickContentDescription("Begin");
                driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(firstName); // enter
                // firstName
                clickContentDescription("Next");
                waitUntilXpath("//android.widget.Button[@content-desc='Next']");
                clickContentDescription("Next");
        }

        /*
         * Click Privacy Questions
         */
        @Test(priority = 2, dependsOnMethods = { "testBegin" })
        public void testPrivacy() {
                waitUntilXpath("//android.view.View[contains(@content-desc, 'Spill the truth')]");
                clickContentDescription(investTime[randomize(0, 4)]); // time spent on investing stocks
                clickContentDescription("Next");
                clickContentDescription(salary[randomize(0, 4)]); // salary
                clickContentDescription("Next");
                clickContentDescription(financialStability[randomize(0, 4)]); // financial stability
                clickContentDescription("Next");
                clickContentDescription(riskLevel[randomize(0, 4)]); // investment risk level
                clickContentDescription("Next");
                driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(String.valueOf(age)); // enter age
                clickContentDescription("Next");

                try {
                        String expectedView = "Age is just a number.You picked us, so you are already ahead of the game!Ok! Let’s get to know more about you!";
                        String actualView = driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Age')]"))
                                .getAttribute("contentDescription").replace("\n", "");
                        Assert.assertEquals(actualView, expectedView, "View is not happy flow at PPI (Privacy)");
                } catch (Exception e) {
                        System.out.println("Unhappy flow (Privacy)");
                        failPrivacy();
                }
        }

        public void failPrivacy() {
                clickElementByXpath("//android.widget.Button[@content-desc='TRY AGAIN']");
                testPrivacy();
        }

        /*
         * Click Personality Questions
         */
        @Test(priority = 3, dependsOnMethods = { "testPrivacy" })
        public void testPersonality() {
                clickElementByXpath("//android.widget.Button[@content-desc='SURE']");
                waitUntilXpath("//android.view.View");
                clickContentDescription(richVocab[randomize(0, 4)]); // rich vocab
                clickContentDescription("Next");
                clickContentDescription(learnNewThings[randomize(0, 4)]); // learn new things
                clickContentDescription("Next");
                clickContentDescription(vividImagination[randomize(0, 4)]); // vivid imagination
                clickContentDescription("Next");
                clickContentDescription(fidgetAndBadDream[randomize(0, 4)]); // sit still without fidgeting
                clickContentDescription("Next");
                clickContentDescription(fidgetAndBadDream[randomize(0, 4)]); // trouble sleeping
                clickContentDescription("Next");
                clickContentDescription(annoyedStrangersConvo[randomize(0, 4)]); // easily annoyed
                clickContentDescription("Next");
                clickContentDescription(annoyedStrangersConvo[randomize(0, 4)]); // talk to strangers
                clickContentDescription("Next");
                clickContentDescription(annoyedStrangersConvo[randomize(0, 4)]); // start conversations
                clickContentDescription("Next");
                clickContentDescription(energetic[randomize(0, 4)]); // energetic
                clickContentDescription("Next");
                implicitWait(3);
                waitUntilXpath("//android.widget.Button[@content-desc='Got It']");
                clickElementByXpath("//android.widget.Button[@content-desc='Got It']");
        }

        /*
         * Enter email and password to sign up
         */
        @Test(priority = 4, dependsOnMethods = { "testPersonality" })
        public void testSignUp() {
                waitUntilXpath("//android.view.View");
                clickElementsByXpath("//android.widget.EditText", 0);
                driver.findElements(By.xpath("//android.widget.EditText")).get(0)
                                .sendKeys(email + "@yopmail.com");
                System.out.println("email: " + email + "@yopmail.com");
                waitUntilXpath("//android.widget.EditText");
                clickElementsByXpath("//android.widget.EditText", 1);
                driver.findElements(By.xpath("//android.widget.EditText")).get(1).sendKeys(password);
                clickContentDescription("Sign Up");
        }

        /*
         * Verify account using yopmail
         */
        @Test(priority = 5, dependsOnMethods = { "testSignUp" })
        public void testVerifyEmail() {
                waitUntilXpath("//android.view.View[contains(@content-desc, 'sent an email to')]");
                ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.HOME));
                driver.findElement(AppiumBy.accessibilityId("Chrome")).click();
                implicitWait(10);
                driver.findElement(By.id("com.android.chrome:id/menu_button")).click();
                implicitWait(10);
                clickElementByXpath("//android.widget.TextView[@content-desc='New tab']");
                clickElementByClass(FIND_BY_EDIT_TEXT);
                implicitWait(3);
                wait.until(ExpectedConditions
                                .visibilityOfElementLocated(By.className(FIND_BY_EDIT_TEXT)));
                driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys("https://yopmail.com/en/");
                ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
                implicitWait(5);
                waitUntilXpath("//android.widget.EditText[contains(@resource-id, 'login')]");
                driver.findElement(By.xpath("//android.widget.EditText[contains(@resource-id, 'login')]")).click();
                driver.findElement(By.xpath("//android.widget.EditText[contains(@resource-id, 'login')]")).sendKeys(email);
                wait.until(ExpectedConditions.textToBePresentInElement(driver.findElement(By.xpath("//android.widget.EditText[contains(@resource-id, 'login')]")), email));
                clickElementByXpath("//android.view.View[contains(@resource-id, 'refreshbut')]");
                implicitWait(5);
                waitUntilXpath("//android.widget.Button[contains(@text, 'Asklora')]");
                clickElementByXpath("//android.widget.Button[contains(@text, 'Asklora')]");
                implicitWait(3);
                waitUntilXpath("//android.view.View[@content-desc='Verify Email']");
                clickElementByXpath("//android.view.View[@content-desc='Verify Email']");
                implicitWait(5);
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("android:id/title")));

                if (!(driver.findElement(By.id("android:id/button_once")).isEnabled())) { // Check if the "Just Once"
                                                                                          // Button is disabled
                        driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                        "new UiSelector().textContains(\" " + TEST_APP + " \")"))
                                        .click();
                        implicitWait(3);
                        driver.findElement(By.id("android:id/button_once")).click();
                } else {
                        driver.findElement(By.id("android:id/button_once")).click();
                }
        }

        @Test(priority = 6, dependsOnMethods = { "testVerifyEmail" })
        public void testInvestmentStyle() {
                clickElementByXpath("//android.widget.Button[@content-desc='Define Investment Style']");
                clickClassName(FIND_BY_EDIT_TEXT);
                randomizeKeyword();
                clickContentDescription("Next");
                clickContentDescription(investDuration[randomize(0, 4)]);
                clickContentDescription("Next");
                clickContentDescription(largeAmount[randomize(0, 4)]);
                clickContentDescription("Next");
                clickContentDescription(investmentScenario[randomize(0, 3)]);
                clickContentDescription("Next");

                try {
                        String expectedView = "Your investment style is all set!";
                        String actualView = driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'all set!')]")).getAttribute("contentDescription");
                        Assert.assertEquals(actualView, expectedView, "View is not a happy flow at PPI (Investment Style)");
                } catch (Exception e) {
                        System.out.println("Unhappy flow (Investment Style)");
                        failInvestmentStyle();
                }

        }

        public void failInvestmentStyle() {
                clickElementByXpath("//android.widget.Button[contains(@content-desc, 'Retake Investment Style')]");
                testInvestmentStyle();
        }

        @Test(priority = 7, dependsOnMethods = { "testInvestmentStyle" })
        public void testAccountSetUp() {
                waitUntilXpath("//android.widget.Button[contains(@content-desc, 'Investment')]");
                clickElementByXpath("//android.widget.Button[contains(@content-desc, 'Investment Account')]");
                waitUntilXpath("//android.view.View[contains(@content-desc, 'Account opening and deposit')]");
                clickContentDescription("Open Account Now");
                clickElementByXpath("(//android.view.View[@content-desc='No'])[1]");
                clickElementByXpath("(//android.view.View[@content-desc='Yes'])[2]");
                clickContentDescription("Next");
                clickElementsByClass(FIND_BY_EDIT_TEXT, 0);
                driver.findElements(By.className(FIND_BY_EDIT_TEXT)).get(0).sendKeys(firstName);
                clickElementsByClass(FIND_BY_EDIT_TEXT, 1);
                driver.findElements(By.className(FIND_BY_EDIT_TEXT)).get(1).sendKeys(lastName);
                clickElementByXpath(("//android.view.View[@content-desc='" + gender + "']"));
                clickElementsByClass(FIND_BY_EDIT_TEXT, 2);
                driver.findElements(By.className(FIND_BY_EDIT_TEXT)).get(2).sendKeys(hkid);
                clickContentDescription("Nationality");
                clickElementByXpath("//android.view.View[contains(@content-desc, 'Hong Kong SAR')]");
                clickContentDescription("Country Of Birth");
                clickElementByXpath("//android.view.View[contains(@content-desc, 'Hong Kong SAR')]");
                scrollDown();
                clickElementByXpath("//android.view.View[contains(@content-desc, 'Phone')]/android.widget.EditText[2]");
                driver.findElement(
                                By.xpath("//android.view.View[contains(@content-desc, 'Phone')]/android.widget.EditText[2]"))
                                .sendKeys(phoneNum);
                clickContentDescription("Next");
                getOTP();
        }

        @Test(priority = 8, dependsOnMethods = { "testAccountSetUp" })
        public void testAddress() {
                List<WebElement> addressTextFields = driver
                                .findElements(By.className(FIND_BY_EDIT_TEXT));
                System.out.println("Text Fields: " + addressTextFields);
                clickElementsByClass(FIND_BY_EDIT_TEXT, 0);
                driver.findElements(By.className(FIND_BY_EDIT_TEXT)).get(0).sendKeys(address);
                clickElementByXpath("//android.widget.Button[contains(@content-desc, 'District')]");
                clickElementByXpath("//android.view.View[contains(@content-desc, 'Islands')]");
                clickElementByXpath("//android.widget.Button[contains(@content-desc, 'Region')]");
                clickElementByXpath("//android.view.View[contains(@content-desc, '" + city + "')]");
                clickClassName(FIND_BY_IMAGE_VIEW);
                getImage();
                clickContentDescription("Next");
                clickContentDescription("Confirm & Continue");
        }

        @Test(priority = 9, dependsOnMethods = { "testAddress" })
        public void testFinancialProfile() {
                clickContentDescription("No");
                driver.findElement(By
                                .xpath("//android.widget.Button[contains(@content-desc, 'Employment Status')]"))
                                .click();
                clickElementByXpath("//android.view.View[@content-desc='Student']");
                clickContentDescription("Next");
                clickElementByXpath("//android.view.View[@content-desc='Income from Employment']");
                clickContentDescription("Next");
                clickElementByXpath("//android.widget.Button[@content-desc=' No']");
                clickContentDescription("Confirm & Continue");
                clickElementByXpath("//android.widget.Button[@content-desc='Verify Now']");
                WebDriverWait waitForVerification = new WebDriverWait(driver, Duration.ofSeconds(120));
                waitForVerification.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.widget.ImageView[@content-desc='Asklora Customer Agreement.pdf']")));
                driver.findElement(
                                By.xpath("//android.widget.ImageView[contains(@content-desc, 'Asklora Customer Agreement')]"))
                                .click();
                clickElementsByClass(FIND_BY_CHECK_BOX, 0);
                clickElementsByClass(FIND_BY_CHECK_BOX, 1);
                scrollDown();
                clickElementByXpath("//android.widget.Button[@content-desc='Agree']");
                clickClassName(FIND_BY_CHECK_BOX);
                clickElementByXpath("//android.widget.Button[@content-desc='Agree']");
                clickClassName(FIND_BY_CHECK_BOX);
                scrollDown();
                clickClassName(FIND_BY_EDIT_TEXT);
                driver.findElement(By.className(FIND_BY_EDIT_TEXT))
                                .sendKeys(firstName + " " + lastName);
                scrollDown();
                clickElementByXpath("//android.widget.Button[@content-desc='Agree']");
                clickContentDescription("Complete");
        }

        @Test(priority = 10, dependsOnMethods = { "testFinancialProfile" })
        public void testDepositFunds() {
                waitUntilXpath("//android.widget.Button[contains(@content-desc, 'Deposit Funds')]");
                clickElementByXpath("//android.widget.Button[@content-desc='Deposit Funds']");
                clickClassName(FIND_BY_EDIT_TEXT);
                driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys("10000");
                clickElementByClass("android.widget.ScrollView");
                scrollDown();
                clickElementByClass(FIND_BY_IMAGE_VIEW);
                getImage();
                clickElementByXpath("//android.widget.Button[@content-desc='Continue']");
                waitUntilXpath("//android.widget.Button[@content-desc='Done']");
                clickElementByXpath("//android.widget.Button[@content-desc='Done']");
        }

        @AfterTest
        public void tearDown() {
                driver.quit();
        }

        public void implicitWait(int period) {
                driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(period < 1 ? 3 : period));
        }

        public void waitUntilXpath(String element) {
                wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(element)));
        }

        public String getPropValues(String var) throws IOException {
                Properties prop = new Properties();
                FileInputStream ip = new FileInputStream("config.properties");
                prop.load(ip);
                return prop.getProperty(var);
        }

        public void clickContentDescription(String element) {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                        ".scrollIntoView(new UiSelector().descriptionContains(\"" + element + "\"))"))
                        .click();
        }

        public void clickClassName(String element) {
                driver.findElement(new AppiumBy.ByAndroidUIAutomator(
                                "new UiScrollable(new UiSelector().scrollable(true))" +
                                        ".scrollIntoView(new UiSelector().className(\"" + element + "\"))"))
                        .click();
        }

        public void clickElementByXpath(String element) {
                driver.findElement(By.xpath(element)).click();
        }

        public void clickElementsByXpath(String element, int num) {
                driver.findElements(By.xpath(element)).get(num).click();
        }

        public void clickElementByClass(String element) {
                driver.findElement(By.className(element)).click();
        }

        public void clickElementsByClass(String element, int num) {
                driver.findElements(By.className(element)).get(num).click();
        }

        public void getOTP() {
//                if (deviceName.contains("M2101K9G")) {
//                        implicitWait(3);
//                        ((AndroidDriver) driver).openNotifications();
//                        waitUntilXpath("//android.widget.Button[contains(@content-desc, 'Copy')]");
//                        clickElementByXpath("//android.widget.Button[contains(@content-desc, 'Copy')]");
//                        ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.BACK));
//                        otp = ((AndroidDriver) driver).getClipboardText();
//                        System.out.println("Received otp: " + otp);
//                        clickClassName(FIND_BY_EDIT_TEXT);
//                        driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(otp);
//                }
                Scanner scanner = new Scanner(System.in);
                System.out.print("Enter otp: ");
                otp = scanner.nextLine();
                System.out.println("Received otp: " + otp);
                clickClassName(FIND_BY_EDIT_TEXT);
                driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(otp);
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
                wait.until(ExpectedConditions
                        .visibilityOfElementLocated(By.className("android.widget.RelativeLayout")));
                clickElementByClass("android.widget.RelativeLayout");
                wait.until(ExpectedConditions.visibilityOfElementLocated(
                        By.id("com.google.android.apps.photos:id/action_mode_bar")));
                clickElementByXpath("//android.view.ViewGroup[contains(@content-desc, 'Photo')]");
        }

        public void getPerson() throws IOException {
                Document doc = Jsoup.connect("https://fakeit.receivefreesms.co.uk/c/hk/").get();

                Elements table = doc.getElementsByClass("table table-striped");
                Elements tr = table.select("tr");

                for (Element row : tr) {
                        Element col1 = row.select("th").get(0);
                        Element col2 = row.select("th").get(1);

                        if (col1.text().equals("Address"))
                                address = row.select("td").get(0).text();
                        if (col1.text().equals("City"))
                                city = row.select("td").get(0).text();
                        if (col1.text().equals("Gender"))
                                gender = row.select("td").get(0).text();

                        if (col2.text().equals("Name"))
                                name = row.select("td").get(1).text();

                }

                String[] splitStr = name.split("\\s+");
                firstName = splitStr[0];
                lastName = splitStr[1];
        }

        public void randomizeKeyword() {
                List<String> strList = Arrays.asList(omnisearch);
                Collections.shuffle(strList);
                strList.toArray(omnisearch);
                int randNum = randomize(1, omnisearch.length-1);
                for (int i = 0; i < randNum; i++) {
                        driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(omnisearch[i]);
                        clickElementByClass("android.widget.Button");
                        clickClassName(FIND_BY_EDIT_TEXT);
                }
        }

        public int randomize(int min, int max) {
                return ThreadLocalRandom.current().nextInt(min, max + 1);
        }
}