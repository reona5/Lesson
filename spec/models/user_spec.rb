# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  It '重複したメールアドレスなら無効な状態であること'
end
