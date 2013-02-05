# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PhotoTaggings" do
    describe "Admin" do
      describe "photo_taggings" do
        login_refinery_user

        describe "photo_taggings list" do
          before do
            FactoryGirl.create(:photo_tagging, :titel => "UniqueTitleOne")
            FactoryGirl.create(:photo_tagging, :titel => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.photo_taggings_admin_photo_taggings_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.photo_taggings_admin_photo_taggings_path

            click_link "Add New Photo Tagging"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Titel", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PhotoTaggings::PhotoTagging.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Titel can't be blank")
              Refinery::PhotoTaggings::PhotoTagging.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:photo_tagging, :titel => "UniqueTitle") }

            it "should fail" do
              visit refinery.photo_taggings_admin_photo_taggings_path

              click_link "Add New Photo Tagging"

              fill_in "Titel", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PhotoTaggings::PhotoTagging.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:photo_tagging, :titel => "A titel") }

          it "should succeed" do
            visit refinery.photo_taggings_admin_photo_taggings_path

            within ".actions" do
              click_link "Edit this photo tagging"
            end

            fill_in "Titel", :with => "A different titel"
            click_button "Save"

            page.should have_content("'A different titel' was successfully updated.")
            page.should have_no_content("A titel")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:photo_tagging, :titel => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.photo_taggings_admin_photo_taggings_path

            click_link "Remove this photo tagging forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PhotoTaggings::PhotoTagging.count.should == 0
          end
        end

      end
    end
  end
end
