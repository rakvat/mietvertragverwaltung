module TenantsHelper
  def self.label(tenant)
    "#{tenant.prename} #{tenant.name}"
  end
end
