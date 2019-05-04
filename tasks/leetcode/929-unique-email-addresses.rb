# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  emails_hash_table = {}

  emails.each do |email|
    local_name, domain_name = email.split('@')
    base_local_name = local_name.split('+')[0]
    base_local_name_without_dots = base_local_name.delete('.')

    hash_key = domain_name + base_local_name_without_dots

    emails_hash_table[hash_key] = nil
  end


  emails_hash_table.count
end


ex1 = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]


p num_unique_emails(ex1) == 2
