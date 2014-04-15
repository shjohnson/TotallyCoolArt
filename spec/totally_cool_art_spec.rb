require 'spec_helper'
require './lib/totally_cool_art/gallery.rb'
require './lib/totally_cool_art/ticket.rb'

describe TotallyCoolArt::Gallery do

  describe '#list_of_galleries' do
    it 'should return an array of galleries' do
      html_data = double('return', parsed_response: 'gallery')
      HTTParty.should_receive(:get).with('http://arts-api.herokuapp.com/galleries').and_return(html_data)
      subject.list_of_galleries.should eq 'gallery'

    end
  end

  describe '#specific_gallery' do
    it 'should return the information for a specific gallery' do
      number = 1
      html_data = double('return', parsed_response: 'gallery1')
      HTTParty.should_receive(:get).with("http://arts-api.herokuapp.com/galleries/#{number}").and_return(html_data)
      subject.specific_gallery(number).should eq 'gallery1'

    end
    
  end

  describe '#exhibitions_at_gallery' do
    it 'should show all available exhibitions on at gallery' do
      number = 1
      html_data = double('return', parsed_response: 'gallery1')
      HTTParty.should_receive(:get).with("http://arts-api.herokuapp.com/galleries/#{number}/exhibitions").and_return(html_data)
      subject.exhibitions_at_gallery(number).should eq 'gallery1'
      
    end
    

  end
  
end

describe TotallyCoolArt::Ticket do
  let(:gallery_number) { 1 }
  let(:name){"Stanley"}
  let(:date){"12/06/2014 14:00"}
  let(:ticket_details){ {"id" => 4} }
  let(:ticket){double('return', parsed_response: ticket_details)}
  subject { TotallyCoolArt::Ticket.new(gallery_number, name, date)}

  describe '#save' do
    
    it 'should save the ticket with the correct details' do
      HTTParty.should_receive(:post).with('http://arts-api.herokuapp.com/tickets' , {
        :body => { 
          :ticket => { 
            :exhibition_id => gallery_number, 
            :name => name,
            :entry_at => date
          }
        }
        }).and_return(ticket)
      # response.stub(parsed_response).and_return()
      subject.save
    end

    it "should set the returned id" do
      HTTParty.stub(:post).and_return(ticket)
      subject.save
      subject.id.should eq 4
    end

    it "should return the response" do
    end
  end


end















