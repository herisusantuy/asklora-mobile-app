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
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

public class AndroidDepositTest {

    AppiumDriver driver;
    WebDriverWait wait;
    String platformVersion;
    String udid;
    String deviceName;
    Map<String, String> deviceProperties = new HashMap<>();

    final String FIND_BY_EDIT_TEXT = "android.widget.EditText";
    final String PORTFOLIO_VIEW = "//android.widget.ImageView[contains(@content-desc, 'Total Portfolio Value')]";

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
        Assert.assertTrue(driver.findElement(By.xpath(PORTFOLIO_VIEW)).isDisplayed());
    }

    @Test(priority = 2)
    public void testDepositView() {
        clickElementByXpath("//android.widget.ImageView[contains(@content-desc, 'Total Portfolio Value')]/android.widget.Button[1]");
        clickContentDescription("Continue");
        Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Transfer')]"))
                .isDisplayed(), "Portfolio view is not displayed");
    }

    @Test(priority = 3)
    public void testDepositValue() {
        clickElementByClass(FIND_BY_EDIT_TEXT);
        driver.findElement(By.className(FIND_BY_EDIT_TEXT)).sendKeys(String.valueOf(randomize(100, 1000)));
        clickContentDescription("Continue");
        Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Deposit Request Submitted')]"))
                .isDisplayed(), "Unexpected view is displayed");
    }

    @Test(priority = 4)
    public void testFinish() {
        clickElementByXpath("//android.widget.Button[@content-desc='Done']");
        Assert.assertTrue(driver.findElement(By.xpath(PORTFOLIO_VIEW))
                .isDisplayed(), "Unexpected view is displayed");
    }

    public void getPropValues() throws IOException {
        Properties prop = new Properties();
        FileInputStream ip = new FileInputStream("config.properties");
        prop.load(ip);
        prop.forEach((k, v) -> deviceProperties.put((String) k, (String) v));
        System.out.println(deviceProperties);

        platformVersion = deviceProperties.get("platformVersion");
        udid = deviceProperties.get("udid");
        deviceName = deviceProperties.get("deviceName");
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

    public int randomize(int min, int max) {
        return ThreadLocalRandom.current().nextInt(min, max + 1);
    }
}
