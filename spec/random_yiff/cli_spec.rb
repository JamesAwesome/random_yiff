require 'spec_helper'
require 'random_yiff/cli'

$0 = 'yiff'
ARGV.clear

describe RandomYiff::Cli do
  include_context :e621

  describe '#open' do
    it 'opens random furry pr0n via Launchy' do
      allow(Launchy).to receive(:open).with(e621_image_url)
      RandomYiff::Cli.start
      expect(Launchy).to have_received(:open).with(e621_image_url)
    end
  end

  describe '#download' do
    before do
      allow(File).to receive(:write).and_return(true)
    end

    context 'When called without options' do
      it 'downloads random furry pr0n to pwd' do
        RandomYiff::Cli.start(['download'])
        expect(File).to have_received(:write)
          .with("./#{e621_image_name}", 'yiff')
      end
    end

    context 'When called with `path` option' do
      it 'downloads random furry pr0n into path provided' do
        RandomYiff::Cli.start(%w(download --path /foo))
        expect(File).to have_received(:write)
          .with("/foo/#{e621_image_name}", 'yiff')
      end
    end
  end

  describe '#ascii' do
    let(:furry_pr0n) { instance_double(AsciiArt) }
    it 'prints a random furry pr0n image as ascii' do
      allow(AsciiArt).to receive(:new).and_return(furry_pr0n)
      allow(furry_pr0n).to receive(:to_ascii_art).and_return('yiff')
      expect { RandomYiff::Cli.start(['ascii']) }
        .to output("yiff\n").to_stdout
    end
  end
end
