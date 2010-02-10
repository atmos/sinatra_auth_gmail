require File.dirname(__FILE__) + '/spec_helper'

describe "Sinatra::Auth::Gmail" do
  it "validates via something other than a browser" do
    pending do
      get '/'
      last_response.should be_successful
    end
  end
end
