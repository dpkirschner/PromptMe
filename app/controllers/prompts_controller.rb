class PromptsController < ApplicationController
  def prompt 
    hot = reddit.get_hot("writingprompts")
    @prompt = random(filter(hot))
  end
  
  private
    def reddit
      Redd.it(:userless, "notafakedan", "AWAmjMasqnFAzxLsr5V5gpmO7IU")
    end
    
    def filter(prompts=[])
      prompts
        .select{ |prompt| prompt.title[/^\[WP\]/] }
        .map { |prompt| prompt.title.gsub! /^\s*\[WP\]\s/, ""; prompt}
    end
      
    
    def random(prompts=[])
      prompts[rand(0..(prompts.size-1))]
    end
end