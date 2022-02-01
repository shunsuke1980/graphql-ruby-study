module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, Types::UserType, null: false do
      description 'ユーザ情報を1件取得する'
      argument :id, Int, required: true, description: 'ユーザID'
    end

    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false, description: 'ユーザ情報を全件取得する'
    def users
      User.all
    end
  end
end
