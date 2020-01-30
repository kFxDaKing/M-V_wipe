ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('V&M_wipe:wipePlayer', function(player_id)
    local xPlayer = ESX.GetPlayerFromId(player_id)
    local identifier = xPlayer.identifier
    
    DropPlayer(player_id, 'Tout tes proches pleure ta disparition mais une nouvelle vie t\'attend bonne chance')
   
    MySQL.Async.execute(string.format('DELETE users, addon_account_data, billing, characters, communityservice, datastore_data, dpkeybinds, open_car, owned_properties, owned_vehicles, phone_calls, phone_messages, phone_users_contacts, user_accounts, user_inventory, user_licenses FROM users LEFT JOIN addon_account_data ON users.identifier = addon_account_data.owner LEFT JOIN billing ON users.identifier = billing.sender OR users.identifier = billing.identifier LEFT JOIN characters ON users.identifier = characters.identifier LEFT JOIN communityservice ON users.identifier = communityservice.identifier LEFT JOIN datastore_data ON users.identifier = datastore_data.owner LEFT JOIN dpkeybinds ON users.identifier = dpkeybinds.id LEFT JOIN open_car ON users.identifier = open_car.identifier LEFT JOIN owned_properties ON users.identifier = owned_properties.owner LEFT JOIN owned_vehicles ON users.identifier = owned_vehicles.owner LEFT JOIN phone_calls ON users.identifier = phone_calls.owner LEFT JOIN phone_messages ON users.identifier = phone_messages.owner LEFT JOIN phone_users_contacts ON users.identifier = phone_users_contacts.identifier LEFT JOIN user_accounts ON users.identifier = user_accounts.identifier LEFT JOIN user_inventory ON users.identifier = user_inventory.identifier LEFT JOIN user_licenses ON users.identifier = user_licenses.owner WHERE users.identifier = @identifier'), {
                ['@identifier'] = identifier
            })
end)


ESX.RegisterUsableItem('wipe', function(player_id)

    TriggerEvent('V&M_wipe:wipePlayer', player_id)
end)