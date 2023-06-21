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
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

public class AndroidWithdrawTest {

    AppiumDriver driver;
    WebDriverWait wait;
    String platformVersion;
    String udid;
    String deviceName;
    String withdrawVal;
    Map<String, String> deviceProperties = new HashMap<>();

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
    public void testWithdrawView() {
        clickElementByXpath("//android.widget.ImageView[contains(@content-desc, 'Total Portfolio Value')]/android.widget.Button[2]");
        clickElementByXpath("//android.widget.Button[@content-desc='Withdraw']");
        Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Withdrawable Amount')]")).isDisplayed());
    }

    @Test(priority = 3)
    public void testWithdrawValue() {
        withdrawVal = String.valueOf(randomize(100, 10000));
        int[] withdrawInts = new int[withdrawVal.length()];
        for (int i = 0; i < withdrawVal.length(); i++) {
            withdrawInts[i] = withdrawVal.charAt(i) - '0';
        }
        System.out.println(Arrays.toString(withdrawInts));
        for (int i = 0; i < withdrawVal.length(); i++) {
            driver.findElement(By.xpath("//android.view.View[@content-desc='" + withdrawInts[i] + "']")).click();
        }
        clickContentDescription("Next");
        Assert.assertTrue(driver.findElement(By.xpath("//android.view.View[contains(@content-desc, 'Your withdrawal can take')]")).isDisplayed());
    }

    @Test(priority = 4)
    public void testConfirmWithdraw() {
        clickContentDescription("Confirm");
        clickContentDescription("Done");
        Assert.assertTrue(driver.findElement(By.xpath(PORTFOLIO_VIEW)).isDisplayed());
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
