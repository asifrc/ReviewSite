require 'spec_helper'

describe "invitations/new" do
  describe "rendering invitation form" do
    before do
      @jc = FactoryGirl.create(:junior_consultant)
      @review = FactoryGirl.create(:review, junior_consultant: @jc, feedback_deadline: Date.today)
    end

    subject do
      render
      rendered
    end

    it { should =~ /To \(Email\):/ }
    it { should =~ /You've been invited to give feedback for #{@jc.name}/ }
    it { should =~ /Body \(Please add a personal note\):/ }
    it { should =~ /#{@jc.name}/ }
    it { should =~ /#{@review.review_type}/ }
    it { should =~ /#{@review.feedback_deadline}/ }
    it { should =~ /#{new_review_feedback_url(@review)}/ }
  end
end