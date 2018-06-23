# ユーザ作成
User.create(name:"西郷隆盛", email:"saigou@sample.com", password:"saigou")
User.create(name:"坂本龍馬", email:"sakamoto@sample.com", password:"sakamoto")

# 施設作成
Facility.create(facility_number:"F001", name:"第一小学校", district:"北区", address:"テスト市北区1-1", facility_type:"学校教育施設", floor_area:2200, division_in_charge:"教育総務課", last_updated_user_id:1)
Facility.create(facility_number:"F002", name:"北区文化センター", district:"北区", address:"テスト市北区1-2", facility_type:"市民文化施設", floor_area:400, division_in_charge:"文化振興課", last_updated_user_id:1)
Facility.create(facility_number:"F003", name:"北区図書館", district:"北区", address:"テスト市北区1-3", facility_type:"市民文化施設", floor_area:800, division_in_charge:"文化振興課", last_updated_user_id:1)
Facility.create(facility_number:"F004", name:"市立博物館", district:"北区", address:"テスト市北区1-4", facility_type:"市民文化施設", floor_area:1000, division_in_charge:"文化振興課", last_updated_user_id:1)

# 建物作成
Building.create(building_number:"B001", name:"第一小学校 北校舎", facility_id:1, construction_year:1980, floor_area:1000, last_updated_user_id:1)
Building.create(building_number:"B002", name:"第一小学校 南校舎", facility_id:1, construction_year:2000, floor_area:1000, last_updated_user_id:1)
Building.create(building_number:"B003", name:"第一小学校 体育館", facility_id:1, construction_year:1980, floor_area:200, last_updated_user_id:1)
Building.create(building_number:"B004", name:"北区文化会館", facility_id:1, construction_year:2010, floor_area:1200, last_updated_user_id:1)
Building.create(building_number:"B005", name:"市立博物館", facility_id:1, construction_year:2005, floor_area:1000, last_updated_user_id:1)

# 関係
Relationship.create(facility_id:1, building_id:1)
Relationship.create(facility_id:1, building_id:2)
Relationship.create(facility_id:1, building_id:3)
Relationship.create(facility_id:2, building_id:4)
Relationship.create(facility_id:3, building_id:4)
Relationship.create(facility_id:4, building_id:5)