require 'octokit'
require 'json'

user = Octokit.user 'blueberryt'
p user.repositories
