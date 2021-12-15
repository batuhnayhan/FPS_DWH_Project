from datetime import date
from selenium import webdriver
import time
import pandas as pd
from datetime import datetime
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

options = webdriver.ChromeOptions()
options.add_experimental_option("excludeSwitches", ["enable-logging"])
# options.add_argument("headless")
driver_path = r"chromedriver.exe"

driver = webdriver.Chrome(options=options, executable_path=driver_path)

driver.maximize_window()

seasons = ['/2021-2022','/2020-2021','/2019-2020','/2018-2019','/2017-2018']

Standard_Stats = "https://fbref.com/en/comps/Big5{}/stats/players/Big-5-European-Leagues-Stats"
Goalkeeping = "https://fbref.com/en/comps/Big5{}/keepers/players/Big-5-European-Leagues-Stats"
Advanced_Goalkeeping = "https://fbref.com/en/comps/Big5{}/keepersadv/players/Big-5-European-Leagues-Stats"
Shooting = "https://fbref.com/en/comps/Big5{}/shooting/players/Big-5-European-Leagues-Stats"
Passing = "https://fbref.com/en/comps/Big5{}/passing/players/Big-5-European-Leagues-Stats"
Pass_Types = "https://fbref.com/en/comps/Big5{}/passing_types/players/Big-5-European-Leagues-Stats"
Goal_and_Shot_Creation = "https://fbref.com/en/comps/Big5{}/gca/players/Big-5-European-Leagues-Stats"
Defensive_Actions = "https://fbref.com/en/comps/Big5{}/defense/players/Big-5-European-Leagues-Stats"
Possession = "https://fbref.com/en/comps/Big5{}/possession/players/Big-5-European-Leagues-Stats"
Playing_Time = "https://fbref.com/en/comps/Big5{}/playingtime/players/Big-5-European-Leagues-Stats"
Miscellaneous_Stats = "https://fbref.com/en/comps/Big5{}/misc/players/Big-5-European-Leagues-Stats"

sites = [Standard_Stats,Goalkeeping,Advanced_Goalkeeping,Shooting,Passing,Pass_Types,Goal_and_Shot_Creation,Defensive_Actions,Possession,Playing_Time,Miscellaneous_Stats]

each_site = []

for i in sites:
    for a in seasons:
        each_site.append(i.format(a))

for i in each_site:
    driver.get(i)
    driver.execute_script("window.scrollBy(0,500)","")
    time.sleep(2)
    try:
        driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]').click()   
        driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]/div/ul/li[4]/button').click()
    except:
        try:
            driver.refresh()
            driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]').click()
            driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]/div/ul/li[4]/button').click()
        except:
            try:
                driver.refresh()
                driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]').click()
                driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]/div/ul/li[4]/button').click()
            except:
                driver.refresh()
                driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]').click()
                driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[1]/div/ul/li[1]/div/ul/li[4]/button').click()  
    finally:
        time.sleep(2)
        data = driver.find_element(By.XPATH,'/html/body/div[2]/div[6]/div[3]/div[3]/div/pre').text  
        df = pd.DataFrame([x.split(',') for x in data.split('\n')])
        df = df.iloc[5::]
        csv_name = i[i.find('Big5')::].replace('/','_').replace('-','_')
        df.to_csv(rf"Data_FBREF\{csv_name}.csv", header=False, index=False, encoding="utf-8-sig")

driver.close()
