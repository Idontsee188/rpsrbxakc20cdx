local keys = {
    trial = {
        lastUpdate = "2024-10-01",
        keys = {
            ["TRIAL-1A2B3C4D5E"] = { expirationDays = 3, banned = false },
            ["TRIAL-6F7E8D9C2A"] = { expirationDays = 3, banned = false },
            ["TRIAL-7B8A9C1D3E"] = { expirationDays = 3, banned = false },
            ["TRIAL-3C4D5E6F7A"] = { expirationDays = 3, banned = false },
            ["TRIAL-8A7B6C5D9E"] = { expirationDays = 3, banned = false },
            ["TRIAL-2F4C7B1D8A"] = { expirationDays = 3, banned = false },
            ["TRIAL-9D8A5C7B4F"] = { expirationDays = 3, banned = false },
            ["TRIAL-5A6B9E7C1D"] = { expirationDays = 3, banned = false },
            ["TRIAL-4D6F9B8A2C"] = { expirationDays = 3, banned = false },
            ["TRIAL-5B4E9C3F82"] = { expirationDays = 3, banned = true }  -- Забаненный ключ
        }
    },
    weekly = {
        lastUpdate = "2024-10-01",
        keys = {
            ["WEEKLY-1C2D3E4F5G"] = { expirationDays = 7, banned = false },
            ["WEEKLY-6A7B8C9D1E"] = { expirationDays = 7, banned = false },
            ["WEEKLY-2F3G4H5J6K"] = { expirationDays = 7, banned = false },
            ["WEEKLY-8B9A1C2D3F"] = { expirationDays = 7, banned = false },
            ["WEEKLY-3E4F5G6H7A"] = { expirationDays = 7, banned = false },
            ["WEEKLY-7C8D9A1B2F"] = { expirationDays = 7, banned = false },
            ["WEEKLY-4G5H6J7K8L"] = { expirationDays = 7, banned = false },
            ["WEEKLY-9A1B2C3D4E"] = { expirationDays = 7, banned = false },
            ["WEEKLY-5F6G7H8J9K"] = { expirationDays = 7, banned = false },
            ["WEEKLY-9F4A2B7C65"] = { expirationDays = 7, banned = true }  -- Забаненный ключ
        }
    },
    monthly = {
        lastUpdate = "2024-10-01",
        keys = {
            ["MONTHLY-1E2F3G4H5J"] = { expirationDays = 30, banned = false },
            ["MONTHLY-6K7L8M9N1A"] = { expirationDays = 30, banned = false },
            ["MONTHLY-2B3C4D5E6F"] = { expirationDays = 30, banned = false },
            ["MONTHLY-8J9K1A2B3C"] = { expirationDays = 30, banned = false },
            ["MONTHLY-3D4E5F6G7H"] = { expirationDays = 30, banned = false },
            ["MONTHLY-7A8B9C1D2E"] = { expirationDays = 30, banned = false },
            ["MONTHLY-4G5H6J7K8L"] = { expirationDays = 30, banned = false },
            ["MONTHLY-9M1N2A3B4C"] = { expirationDays = 30, banned = false },
            ["MONTHLY-5F6G7H8J9K"] = { expirationDays = 30, banned = false },
            ["MONTHLY-5C8F7B9A31"] = { expirationDays = 30, banned = true }  -- Забаненный ключ
        }
    },
    ["3months"] = {
        lastUpdate = "2024-10-01",
        keys = {
            ["3MONTH-1A2B3C4D5E"] = { expirationDays = 90, banned = false },
            ["3MONTH-6F7E8D9C2A"] = { expirationDays = 90, banned = false },
            ["3MONTH-7B8A9C1D3E"] = { expirationDays = 90, banned = false },
            ["3MONTH-3C4D5E6F7A"] = { expirationDays = 90, banned = false },
            ["3MONTH-8A7B6C5D9E"] = { expirationDays = 90, banned = false },
            ["3MONTH-2F4C7B1D8A"] = { expirationDays = 90, banned = false },
            ["3MONTH-9D8A5C7B4F"] = { expirationDays = 90, banned = false },
            ["3MONTH-5A6B9E7C1D"] = { expirationDays = 90, banned = false },
            ["3MONTH-4D6F9B8A2C"] = { expirationDays = 90, banned = false },
            ["3MONTH-7E5A9D2C8B"] = { expirationDays = 90, banned = true }  -- Забаненный ключ
        }
    },
    year = {
        lastUpdate = "2024-10-01",
        keys = {
            ["YEAR-1E2F3G4H5J"] = { expirationDays = 365, banned = false },
            ["YEAR-6K7L8M9N1A"] = { expirationDays = 365, banned = false },
            ["YEAR-2B3C4D5E6F"] = { expirationDays = 365, banned = false },
            ["YEAR-8J9K1A2B3C"] = { expirationDays = 365, banned = false },
            ["YEAR-3D4E5F6G7H"] = { expirationDays = 365, banned = false },
            ["YEAR-7A8B9C1D2E"] = { expirationDays = 365, banned = false },
            ["YEAR-4G5H6J7K8L"] = { expirationDays = 365, banned = false },
            ["YEAR-9M1N2A3B4C"] = { expirationDays = 365, banned = false },
            ["YEAR-5F6G7H8J9K"] = { expirationDays = 365, banned = false },
            ["YEAR-2A5B9D7C4E"] = { expirationDays = 365, banned = true }  -- Забаненный ключ
        }
    },
    developer = {
        lastUpdate = "2024-10-01",
        keys = {
            ["DEV-1A2B3C4D5E"] = { expirationDays = 0, banned = false }  -- Ключ разработчика
        }
    }
}
