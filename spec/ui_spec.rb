require 'ui'

describe UI do

  let(:ui) { UI.new }
  let(:menu) { Menu.new }

  it 'displays an introductory message' do
    expect(ui.header).to eq "********* JULIA'S SOUP FACTORY **********\n\n"
  end

  it 'should raise an error if user inputs total cost wrongly' do
    allow(ui).to receive(:prompt) { "" }
    allow(ui).to receive(:input) { "£1.00" }
    order = double :order, total_cost: "£8.00"
    expect{ui.client_confirms_cost_of(order)}.to raise_error RuntimeError
  end

  it 'should be told to send an sms when total cost is confirmed' do
    allow(STDOUT).to receive(:puts) # stub out all puts statements
    allow(ui).to receive(:prompt) { "" }
    expect(ui).to receive(:input) { "Julia" } #stub out gets.chomp
    expect(ui).to receive(:input) { "+447789223025" }

    # note the order that this is written in
    client = double Client # for the send_sms expectation below
    time = double Time # for the send_sms expectation below

    expect(Client).to receive(:new).and_return client
    expect(Time).to receive(:now).and_return time

    expect(ui).to receive(:send_sms).with(client, time)
    ui.get_client_details
  end

end