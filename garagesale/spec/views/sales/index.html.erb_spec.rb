require 'spec_helper'

describe "sales/index" do
  before(:each) do
    assign(:sales, [
      stub_model(Sale,
        :title => "Title",
        :description => "MyText",
        :address_line1 => "Address Line1",
        :address_line2 => "Address Line2",
        :city => "City",
        :state => "State",
        :zip_code => 1
      ),
      stub_model(Sale,
        :title => "Title",
        :description => "MyText",
        :address_line1 => "Address Line1",
        :address_line2 => "Address Line2",
        :city => "City",
        :state => "State",
        :zip_code => 1
      )
    ])
  end

  it "renders a list of sales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
