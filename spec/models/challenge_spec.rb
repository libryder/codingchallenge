require 'spec_helper'

describe Challenge do

  it { should have_many(:solutions) }
  it { should validate_presence_of(:description) }

end