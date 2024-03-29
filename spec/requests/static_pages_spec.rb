require 'spec_helper'

describe "Static pages" do

   subject { page }

  describe "Home page" do
    before { visit root_path } 

    it { should have_selector('h1', text: 'Sample App') }
   it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }

    #<10.40>
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
    #</10.40>



  end

     subject { page }

  describe "About page" do
    before { visit about_path } 

    it { should have_selector('h1', text: 'About Us') }
       it { should have_selector('title', text: full_title('About Us')) }
  end

       subject { page }

  describe "Contact" do
    before { visit contact_path } 

    it { should have_selector('h1', text: 'Contact') }
      it { should have_selector('title', text: full_title('Contact')) }
  end

       subject { page }

  describe "Help" do
    before { visit help_path } 

    it { should have_selector('h1', text: 'Help') }
      it { should have_selector('title', text: full_title('Help')) }
  end


 it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"   
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    
end
end