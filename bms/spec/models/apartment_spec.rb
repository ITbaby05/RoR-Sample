require 'spec_helper'

describe Apartment do
  before {@apartment = Apartment.new(room: "1", floor: 1, area: 60, price: 124567)}

  describe "when room is not present" do
    before {@apartment.room = " "}
    it {should_not be_valid}
  end
  describe "when floor is not present" do
    before {@apartment.floor = " "}
    it {should_not be_valid}
  end
  describe "when area is not present" do
    before {@apartment.area = " "}
    it {should_not be_valid}
  end
  describe "when price is not present" do
    before {@apartment.price = " "}
    it {should_not be_valid}
  end
end