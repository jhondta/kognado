# frozen_string_literal: true

json.array! @asset_types, partial: 'asset_types/asset_type', as: :asset_type
