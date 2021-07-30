class Shipping_date_id < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },  
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' },
  ]
 
   include ActiveHash::Associations
   has_many :products
 
   validates :Shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  end