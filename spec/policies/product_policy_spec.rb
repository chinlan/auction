require 'rails_helper'

RSpec.describe ProductPolicy do
  subject do
    described_class
  end

  let(:user) do
    create(:user)
  end

  let(:other) do
    create(:user)
  end

  let(:product) do
    create(:product, :published, seller: user)
  end

  permissions :edit?, :update?, :destroy? do
    before do
      sign_in user
      sign_in other
    end

    it 'grants access if user is the owner' do
      expect(subject).to permit(user, product)
    end

    it 'denies access if user is not the owner' do
      expect(subject).not_to permit(other, product)
    end
  end
end
