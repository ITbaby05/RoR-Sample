require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Bms" }

  describe "Feed page" do
    before{visit posts_path}
    it "should have the title 'Bms'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
      expect(page).to have_title('Bms')
    end
	  it "should have the title 'Feed'" do
      expect(page).to have_title("#{base_title} | Feed")
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        FactoryGirl.create(:micropost, user: user, content: "abcd")
        FactoryGirl.create(:micropost, user: user, content: "efgh")
        visit user_path(user)
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector('li', text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user, name: "user1", email: "user1@tdasolution.com") }
        before do
          other_user.follow!(user)
          visit user_path(user)
        end

        it 'should check follower/following' do
          expect(page).to have_link('0 following', href: following_user_path(user))
          expect(page).to have_link('1 followers', href: followers_user_path(user))
        end
      end
    end
  end
  describe "Help page" do
    before{visit help_path}
    it "should have the content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
      expect(page).to have_content('Help')
    end
	it "should have the title 'Help'" do
      expect(page).to have_title("#{base_title} | Help")
    end
  end
  describe "About page" do
    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end
	it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("#{base_title} | About Us")
    end
  end
  describe "Contact page" do
    before {visit contact_path}
    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
      expect(page).to have_selector('h1', text: 'Contact')
    end
    it "should have the title 'Contact'" do
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
