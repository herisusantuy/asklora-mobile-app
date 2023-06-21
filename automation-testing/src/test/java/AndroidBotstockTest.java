import com.google.common.collect.ImmutableMap;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class AndroidBotstockTest {
    AppiumDriver driver;
    WebDriverWait wait;
    String platformVersion;
    String udid;
    String deviceName;
    ArrayList<String> deviceProperties = new ArrayList<>();

    final String FIND_BY_EDIT_TEXT = "android.widget.EditText";
    final String FIND_BY_BUTTON = "android.widget.Button";
    final String PORTFOLIO_VIEW = "//android.widget.ImageView[contains(@content-desc, 'Total Portfolio Value')]";

    String[] omnisearch = { "auto stocks", "bank stocks", "tesla", "car", "tech", "medical", "research", "oil", "burger", "robot" };
    String[] investDuration = {"1 year", "Half a year", "3 Months", "1 Month", "2 Weeks"};
    String[] largeAmount = { "Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly Agree" };
    String[] investmentScenario = { "Limited loss", "Passive income", "Lora please choose for me", "Just buy my stock" };

    @BeforeTest
    public void setUp() throws IOException {
        getPropValues();

        System.out.println("Platform Version: " + platformVersion);
        System.out.println("udid: " + udid);
        System.out.println("Device Name: " + deviceName);

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
        caps.setCapability("noReset", true);
        caps.setCapability("autoLaunch", false);
//                 caps.setCapability("autoGrantPermission", true);
//                 caps.setCapability("appPackage", "ai.asklora.app.stag");
//                 caps.setCapability("appActivity", ".MainActivity");
//                 caps.setCapability("enforceAppInstall", true);
//                 caps.setCapability("skipDeviceInitialization", true);
//                 caps.setCapability("skipServerInstallation", true);
        caps.setCapability("chromeOptions", ImmutableMap.of("w3c", false));
        caps.setCapability("newCommandTimeout", 0);
        driver = new AndroidDriver(new URL("http://localhost:4723/wd/hub"), caps);
        wait = new WebDriverWait(driver, Duration.ofSeconds(60));
    }

    @Test(priority = 1)
    public void testView() {
        clickElementByXpath("//android.widget.ImageView[contains(@content-desc, 'Tab 3 of 4')]");
        Assert.assertTrue(driver.findElement(By.xpath(PORTFOLIO_VIEW)).isDisplayed(), "Portfolio view is not displayed");
    }

    @Test(priority = 2)
    public void testStartBotstock() {
        clickElementByXpath("//android.widget.Button[@content-desc='Start A Botstock']");
        try {
            Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'What gets your investing mojo on')]"))
                    .isDisplayed(), "Omnisearch view is not displayed");
        } catch (Exception e) {
            goToRightView();
        }
    }

    public void goToRightView() {
        clickContentDescription("Change Investment Style");
    }

    @Test(priority = 3)
    public void testKeywords() {
        int resetInt = randomize(0, 1);
        if (resetInt == 0) {
            System.out.println("Not resetting omnisearch");
            clickContentDescription("Next");
            clickContentDescription("View Botstock Recommendation");
        } else {
            System.out.println("Resetting omnisearch");
            clickContentDescription("Reset");
            randomizeKeyword();
            clickContentDescription("Next");
            clickElementsByClass(FIND_BY_BUTTON, 0);
            clickContentDescription(investDuration[randomize(0, 4)]);
            clickElementsByClass(FIND_BY_BUTTON, 1);
            clickContentDescription(largeAmount[randomize(0, 4)]);
            clickElementsByClass(FIND_BY_BUTTON, 2);
            clickContentDescription(investmentScenario[randomize(0, 4)]);
            clickContentDescription("View Botstock Recommendation");
        }
        Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Investments for you')]"))
                .isDisplayed(), "Recommended Botstock view is not displayed");
    }

    @Test(priority = 4)
    public void testTrade() {
        clickElementsByXpath("//android.widget.Button[@content-desc='Trade']", randomize(0, 5));
        clickContentDescription("Trade");
        clickElementByClass(FIND_BY_EDIT_TEXT);
        driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(String.valueOf(randomize(15000, 20000)));
        clickContentDescription("Next");
        clickContentDescription("Confirm");
        clickContentDescription("BACK TO HOME");
        Assert.assertTrue(driver.findElement(By.xpath("//android.widget.ImageView[@content-desc='Tab 1 of 4']"))
                .isSelected(), "Home view is not displayed");
    }

    public void clickElementByXpath(String element) {
        driver.findElement(By.xpath(element)).click();
    }

    public void clickElementByClass(String element) {
        driver.findElement(By.className(element)).click();
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

    public void clickElementsByClass(String element, int num) {
        driver.findElements(By.className(element)).get(num).click();
    }

    public void clickElementsByXpath(String element, int num) {
        driver.findElements(By.xpath(element)).get(num).click();
    }

    public void getPropValues() throws IOException {
        Properties prop = new Properties();
        FileInputStream ip = new FileInputStream("config.properties");
        prop.load(ip);
        prop.forEach((k, v) -> deviceProperties.add((String) v));
        System.out.println(deviceProperties);

        platformVersion = deviceProperties.get(0);
        udid = deviceProperties.get(1);
        deviceName = deviceProperties.get(2);
    }

    public void randomizeKeyword() {
        List<String> strList = Arrays.asList(omnisearch);
        Collections.shuffle(strList);
        strList.toArray(omnisearch);
        int randNum = randomize(2, omnisearch.length-1);
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
