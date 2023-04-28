import geohash2
import requests
import pandas as pd

# 함수로 만들기
def oneroom(addr):

    # 1. 동이름으로 위도 경도 구하기
    url = "https://apis.zigbang.com/search?q={}".format(addr)
    response = requests.get(url)
    lat, lng = response.json()["items"][0]["lat"], response.json()["items"][0]["lng"]

    # 2. 위도 경도로 geohash 알아내기
    geohash = geohash2.encode(lat, lng, precision=5)

    # 3. geohash로 매물 리스트 가져오기
    url = "https://apis.zigbang.com/v2/items?\
deposit_gteq=0&domain=zigbang&geohash={}&rent_gteq=0&sales_type_in=전세|월세&service_type_eq=원룸".format(geohash)
    response = requests.get(url)
    items = response.json()["items"]
    ids = [item["item_id"] for item in items]

    # 4. id로 매물 정보 가져오기
    url = "https://apis.zigbang.com/v2/items/list"
    params = {
        "domain": "zigbang",
        "withCoalition": "false",
        "item_ids": ids[:900],
    }

    response = requests.post(url, params)
    items = response.json()["items"]
    datas = [item for item in items if addr in item["address"]]
    column = ["item_id", "sales_type", "deposit", "rent", "size_m2", "floor",
              "building_floor", "title", "address1", "manage_cost", "reg_date", "is_new"]
    return pd.DataFrame(datas)[column]
