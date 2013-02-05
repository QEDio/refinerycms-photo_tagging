require 'spec_helper'

module Refinery
  module PhotoTaggings
    describe PhotoTagging do
      describe "validations" do
        subject do
          FactoryGirl.create(:photo_tagging,
          :titel => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:titel) { should == "Refinery CMS" }
      end
    end
  end
end
