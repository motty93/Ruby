require 'azure_mgmt_storage'
require 'azure_mgmt_compute'
require 'azure_mgmt_resources'
require 'azure_mgmt_network'
require 'azure_mgmt_powerbi_embedded'
require 'dotenv'
require 'pry'

Dotenv.load

provider = MsRestAzure::ApplicationTokenProvider.new(
             ENV['ACTIVE_DIRECTORY_TENANT_ID'],
             ENV['ACTIVE_DIRECTORY_CLIENT_ID'],
             ENV['ACTIVE_DIRECTORY_CLIENT_SECRET']
           )
credentials = MsRest::TokenCredentials.new(provider)
client = Azure::PowerBiEmbedded::Mgmt::V2016_01_29::PowerBIEmbeddedManagementClient.new(credentials, ENV['ACTIVE_DIRECTORY_BASE_URL'], subscription_id: ENV['AZURE_SUBSCRIPTION_ID'])
# powerbi_client.make_request_async(:get, ENV['ACTIVE_DIRECTORY_BASE_URL'])
collection = Azure::PowerBiEmbedded::Mgmt::V2016_01_29::WorkspaceCollections.new(client)

# options = {
#   tenant_id: ENV['ACTIVE_DIRECTORY_TENANT_ID'],
#   client_id: ENV['ACTIVE_DIRECTORY_CLIENT_ID'],
#   client_secret: ENV['ACTIVE_DIRECTORY_CLIENT_SECRET'],
#   credentials: credentials,
#   base_url: ENV['ACTIVE_DIRECTORY_BASE_URL']
# }
# powerbi_client = Azure::PowerBiEmbedded::Profiles::Latest::Mgmt::Client.new(options)
