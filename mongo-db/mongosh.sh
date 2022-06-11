db.serverStatus().connections  # Total number of connection
db.currentOp() # Active connection with IP address and details
db.currentOp(true) # To show all connections
db.currentOp().inprog.forEach(function(op) {printjson(op.client);}) # Return active sessions running
db.currentOp().inprog.forEach(function(op) {if(op.secs_running > 1) printjson(op.client); }) # Return active sessions running for more than x seconds:
#  Replace with old string in entire table:
db.banners.find({}).forEach(function(e,i) {
    e.click_url=e.click_url.replace("https://abcagement.com/","https://abc.nl/");
    db.banners.save(e);
});