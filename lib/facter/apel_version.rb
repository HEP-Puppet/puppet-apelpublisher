# Fact: apel_version
#
# Purpose: No real meaning yet
#
Facter.add(:apel_version) do
  setcode do
    begin
      "0.0.1"
    end
  end
end

