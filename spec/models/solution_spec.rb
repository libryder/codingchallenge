require 'spec_helper'

describe Solution do

  it { should belong_to(:challenge) }
  it { should validate_presence_of(:gist_url) }
  it { should validate_presence_of(:description) }

end