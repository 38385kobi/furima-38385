require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品登録ができる時" do
      it "全ての情報が正しく入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品登録ができない時" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
    it "nameが空だと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionが空だと出品できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが0以外でないと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "item_condition_idが0以外でないと出品できない" do
      @item.item_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it "shipping_fee_idが0以外でないと出品できない" do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it "prefecture_idが0以外でないと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "delivery_date_idが0以外でないと出品できない" do
      @item.delivery_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it "priceが空だと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが300未満だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000以上だと出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが全角数字では出品できない" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英字では出品できない" do
      @item.price = "sample"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英数字混合では出品できない" do
      @item.price = "sample1000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "userが紐付いていないと出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
