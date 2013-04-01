require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Welcome to Tweet360') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }

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

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

 describe "Help page" do
    before {visit help_path}

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "About page" do
    before {visit about_path}

    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', text: full_title('About Us')) }
  end
  
  describe "Blog page" do
    before {visit blog_path}

    it { should have_selector('h1', text: 'Blog') }
    it { should have_selector('title', text: full_title('Blog')) }  
  end
  
  describe "Status page" do
    before {visit status_path}

    it { should have_selector('h1', text: 'Status') }
    it { should have_selector('title', text: full_title('Status')) }  
  end
  
  describe "Terms page" do
    before {visit terms_path}

    it { should have_selector('h1', text: 'Terms') }
    it { should have_selector('title', text: full_title('Terms')) } 
  end
  
  describe "Privacy page" do
    before {visit privacy_path}

    it { should have_selector('h1', text: 'Privacy') }
    it { should have_selector('title', text: full_title('Privacy')) } 
  end
  
  describe "Advertisers page" do
    before {visit advertisers_path}

    it { should have_selector('h1', text: 'Advertisers') }
    it { should have_selector('title', text: full_title('Advertisers')) } 
  end
  
  describe "Business page" do
    before {visit business_path}

    it { should have_selector('h1', text: 'Business') }
    it { should have_selector('title', text: full_title('Business')) }  
  end
  
  describe "Developers page" do
    before {visit developers_path}

    it { should have_selector('h1', text: 'Developers') }
    it { should have_selector('title', text: full_title('Developers')) }  
  end
  
  describe "Resources page" do
    before {visit resources_path}

    it { should have_selector('h1', text: 'Resources') }
    it { should have_selector('title', text: full_title('Resources')) } 
  end
  
  describe "Media page" do
    before {visit media_path}

    it { should have_selector('h1', text: 'Media') }
    it { should have_selector('title', text: full_title('Media')) } 
  end

  it "should have the right links on the layout" do
    visit root_path
    
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')

  click_link "Help"
  page.should have_selector 'title', text: full_title('Help')

  click_link "Developers"
  page.should have_selector 'title', text: full_title('Developers')

  click_link "Resources"
  page.should have_selector 'title', text: full_title('Resources')

  click_link "Media"
  page.should have_selector 'title', text: full_title('Media')

  click_link "Business"
  page.should have_selector 'title', text: full_title('Business')

  click_link "Blog"
  page.should have_selector 'title', text: full_title('Blog')

  click_link "Status"
  page.should have_selector 'title', text: full_title('Status')

  click_link "Terms"
  page.should have_selector 'title', text: full_title('Terms')

  click_link "Privacy"
  page.should have_selector 'title', text: full_title('Privacy')

  click_link "Advertisers"
  page.should have_selector 'title', text: full_title('Advertisers')

  end                 
end