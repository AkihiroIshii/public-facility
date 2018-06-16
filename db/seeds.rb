# ユーザ作成
User.create(name:"西郷隆盛", email:"saigou@sample.com", password:"saigou")
User.create(name:"坂本龍馬", email:"sakamoto@sample.com", password:"sakamoto")

# 施設作成
Facility.create(name:"第一小学校", district:"北区", address:"テスト市北区1-1", facility_type:"学校教育施設", floor_area:1200, division_in_charge:"教育総務課", last_updated_user_id:1)

# 建物作成
Building.create(name:"第一小学校校舎", construction_year:1980, floor_area:1000, last_updated_user_id:1)
Building.create(name:"第一小学校体育館", construction_year:1980, floor_area:200, last_updated_user_id:1)

# 関係
Relationship.create(facility_id:1, building_id:1)
Relationship.create(facility_id:1, building_id:2)