from myservice.main import router
from fastapi.testclient import TestClient

client = TestClient(router)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}


def test_read_item_with_id_and_query():
    response = client.get("/items/1?q=foo")
    assert response.status_code == 200
    assert response.json() == {"item_id": 1, "q": 'foo'}


def test_read_item_with_id_without_query():
    response = client.get("/items/1")
    assert response.status_code == 200
    assert response.json() == {"item_id": 1, "q": None}
