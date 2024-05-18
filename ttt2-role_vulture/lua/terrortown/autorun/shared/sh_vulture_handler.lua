VULTURE_DATA = {}
VULTURE_DATA.amount_eaten = 0

function VULTURE_DATA:AddEaten()
    self.amount_eaten = self.amount_eaten + 1
end

function VULTURE_DATA:GetEatenAmount()
    return self.amount_eaten
end