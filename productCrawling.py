from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import csv
import logging

target_url = f"https://www.thehyundai.com/front/dpa/searchSectItem.thd?sectId=30002"
file_name = 'data.csv'

logger = logging.getLogger()
logger.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s %(levelname)s %(lineno)d %(message)s')

stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)
logger.addHandler(stream_handler)

driver = webdriver.Chrome(ChromeDriverManager().install())
logger.info("driver loaded")

wait = WebDriverWait(driver, 10)

def click_show_more():
    try:
        driver.find_element(By.XPATH, '//*[@id="form"]/div[1]/div[1]/ul/li/a').click()
    except:
        logger.error("cannot access show more button")

def create_csv() -> None:
    with open(file_name, 'w', newline='', encoding='cp949') as f:
        writer = csv.writer(f)
        writer.writerow(["Category_1", "Category_2", "Brand", "Name", "Price", "Image_URL"])
    logger.info("csv file created")

def write_unit_list(page_units, category_1, brand_name) -> None:
    with open(file_name, 'a', newline='', encoding='cp949') as f:
        try:
            for unit in page_units:
                writer = csv.writer(f)
                product_price = unit.find_element(By.CLASS_NAME, 'price-info').text
                product_name = unit.find_elements(By.TAG_NAME, 'a')[3].text
                product_image_url = unit.find_elements(By.TAG_NAME, 'img')[0].get_attribute("src")
                writer.writerow([category_1, "N/A", brand_name, product_name, product_price, product_image_url])
                logger.debug(f"product name: {product_name} written on CSV")
        except Exception as e:
            logger.warning(e)

def crawl_brand(category_1, brand_name):
    logger.info(f"start crawling: {category_1}: {brand_name}")
    try:
        last_page_number = int(driver.find_element(By.CLASS_NAME, "pagination").find_elements(By.TAG_NAME, "li")[-1].find_element(By.TAG_NAME, "a").get_attribute("href").split("'")[1])
        for page_num in range(2, last_page_number+1):
            page_units = driver.find_elements(By.XPATH, '//*[@class="prod-unit"]')
            write_unit_list(page_units, category_1, brand_name)
    except:
        logger.warning("no pager need")
        page_units = driver.find_elements(By.XPATH, '//*[@class="prod-unit"]')
        write_unit_list(page_units, category_1, brand_name)

def crawl_category(category_1, category_url):
    driver.get(category_url)
    click_show_more()
    brand_list = driver.find_element(By.CLASS_NAME, 'brand-list-wrap').find_elements(By.TAG_NAME, 'a')
    brand_name_list = [i.text.split()[0] for i in brand_list]
    logger.info(f"brand list: {brand_name_list}")
    for i, _ in enumerate(brand_list):
        brand_list = driver.find_element(By.CLASS_NAME, 'brand-list-wrap').find_elements(By.TAG_NAME, 'a')
        logger.info(f"brand: {brand_name_list[i]}")
        brand_name = brand_name_list[i].split()[0]
        try:
            brand_list[i].click()
        except Exception as e:
            logger.error(f"{brand_name} load error: {e}")
        click_show_more()
        crawl_brand(category_1, brand_name)

if __name__ == "__main__":
    driver.get(target_url)
    create_csv()
    category_list = driver.find_element(By.CLASS_NAME, 'category-submenu').find_elements(By.TAG_NAME, 'a')
    category_name_list = [i.text.split("(")[0] for i in category_list]
    logger.info(f'category list: {category_name_list}')
    category_dict = {}
    for category in category_list:
        category_dict[category.text.split("(")[0]] = category.get_attribute("href")
    for category_name in category_dict:
        crawl_category(category_name, category_dict[category_name])
        