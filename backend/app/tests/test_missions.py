def test_create_mission(client, token):
    headers = {"Authorization": f"Bearer {token}"}
    response = client.post("/missions/", json={
        "name": "Apollo",
        "description": "Moon mission",
        "required_certificates": "pilot,engineer",
        "available": True
    }, headers=headers)
    assert response.status_code == 200
    assert response.json()["name"] == "Apollo"

