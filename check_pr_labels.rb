#!/usr/bin/env ruby

require "uri"
require "net/http"
require "json"

$help = <<-END_HELP
Usage: check_pr_labels.rb <OWNER> <REPO> <ISSUE> <IF_LABEL> <THEN_LABEL>

    Check a PR for a label named <IF_LABEL>. If <IF_LABEL> is present then the
    PR must also have <THEN_LABEL> or else the script exits with code 1.

    The script exits normally if:
        - <IF_LABEL> is not present
        - <THEN_LABEL> is present
        - Thus, also <IF_LABEL> and <THEN_LABEL> are present

    The script exits with code 1 if:
        - <IF_LABEL> is present but <THEN_LABEL> is absent.

Example: check_pr_labels.rb cerner terra-frameowrk 1553 '🚧 Blocked: UX Input' '⭐ UX Reviewed'
END_HELP

def die(msg)
    puts $help
    raise msg
end

# Check the args.
owner = ARGV.shift
die "Missing <OWNER>" unless owner
repo = ARGV.shift
die "Missing <REPO>" unless repo
issue =ARGV.shift
die "Missing <ISSUE>" unless issue
if_label = ARGV.shift
die "Missing <IF_LABEL>" unless if_label
then_label = ARGV.shift
die "Missing <THEN_LABEL>" unless then_label

# Get the PR labels.
url = URI("https://api.github.com/repos/#{owner}/#{repo}/issues/#{issue}/labels")
puts "Getting PR lables from #{url}"
https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true
request = Net::HTTP::Get.new(url)
response = https.request(request)
response.value()

# Check for the IF and THEN labels
found_if_label = false
found_then_label = false
labels = JSON.parse(response.body)
labels.each do | label |
    if label["name"] == if_label
        found_if_label = true
    elsif label["name"] == then_label
        found_then_label = true
    end
end

# Return 1 unless the right combo of labels is on the PR
if found_if_label and not found_then_label
    puts "PR has the [#{if_label}] label but is missing the [#{then_label}] label"
    exit(1)
end

puts "PR labels are OK"
