require File.dirname(__FILE__) + "/../spec_helper"

describe Ball do
  it 'should instantiate a ball object with a image loaded' do
    Ball.truth.should be_true
  end
end
