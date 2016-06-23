require 'spec_helper'

describe "sales/show" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :title => "Title",
      :description => "MyText",
      :address_line1 => "Address Line1",
      :address_line2 => "Address Line2",
      :city => "City",
      :state => "State",
      :zip_code => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Address Line1/)
    rendered.should match(/Address Line2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/1/)
  end
end
