---
layout: post
title: An RSpec Cautionary Tale
---
    it "by_status" do
      Form::STATUS.each do |k, v|
        puts "Executing with k = #{k} and v = #{v}"
        form = create(:form, k)        
        expect(Form.by_status(v).count).to eq 1
        expect(Form.by_status(v).first).to eq form
      end
    end
    
    describe "by_status" do
      it "should retrieve by status for draft" do
        form = create(:form, :draft)  
        expect(Form.by_status(Form::STATUS[:draft]).count).to eq 1
        expect(Form.by_status(Form::STATUS[:draft]).first).to eq form
      end

      it "should retrieve by status for ready_to_approve" do
        form = create(:form, :ready_to_approve)  
        expect(Form.by_status(Form::STATUS[:ready_to_approve]).count).to eq 1
        expect(Form.by_status(Form::STATUS[:ready_to_approve]).first).to eq form
        
      end

      it "should retrieve by status for approved" do
        form = create(:form, :approved)  
        expect(Form.by_status(Form::STATUS[:approved]).count).to eq 1
        expect(Form.by_status(Form::STATUS[:approved]).first).to eq form
        
      end

      it "should retrieve by status for retired" do
        form = create(:form, :retired)  
        expect(Form.by_status(Form::STATUS[:retired]).count).to eq 1
        expect(Form.by_status(Form::STATUS[:retired]).first).to eq form
      end
    end