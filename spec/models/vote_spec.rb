require 'rails_helper'

describe Vote do
include TestFactories
  describe "validations" do
    describe "value validation" do

      before do 
        @v =  Vote.new(value: 1)
        @v2 = Vote.new(value: -1)
        @v3 = Vote.new(value: 2)
      end

      describe '#positive vote' do
        it "checks if the vote is positive 1" do 
          expect(@v.valid?).to eq(true) #=> true
        end
      end

      describe '#negative vote' do
        it "checks if the vote is negative 1" do
          expect(@v2.valid?).to eq(true) #=> true
        end
      end

      describe '#invalid vote' do
        it "checks if the vote is invalid" do 
          expect(@v3.valid?).to eq(false) #=> false
        end
      end
    end

    describe 'after_save' do
      it 'calls Post@update_rank after_save' do
        post = associated_post
        vote = Vote.new(value: 1, post: post)
        expect(post).to receive(:update_rank)
        vote.save
      end
    end
      
    end
  end

